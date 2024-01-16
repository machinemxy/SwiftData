//
//  SpendSmartUITests.swift
//  SpendSmartUITests
//
//  Created by 馬学渊 on 2023/12/31.
//

import XCTest

final class SpendSmartUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["UITEST"]
        app.launch()
    }

    func testAddBudgetCategoryAndThenAddAndRemoveTransactions() {
        var budgetListScreen = BudgetListScreen(app: app)
        var addBudgetScreen = AddBudgetScreen(app: app)
        var budgetDetailScreen = BudgetDetailScreen(app: app)

        budgetListScreen.addBudgetCategoryButton.tap()
        addBudgetScreen.titleTextField.tap()
        addBudgetScreen.titleTextField.typeText("Groceries")
        addBudgetScreen.amountTextField.tap()
        addBudgetScreen.amountTextField.typeText("100")
        addBudgetScreen.saveBudgetCategoryButton.tap()
        budgetListScreen.budgetCategoryList.staticTexts["Groceries"].tap()
        budgetDetailScreen.transactionTitleTextField.tap()
        budgetDetailScreen.transactionTitleTextField.typeText("Milk")
        budgetDetailScreen.transactionAmountTextField.tap()
        budgetDetailScreen.transactionAmountTextField.typeText("48")
        budgetDetailScreen.transactionQuantityTextField.tap()
        budgetDetailScreen.transactionQuantityTextField.typeText("")
        budgetDetailScreen.addTransactionButton.tap()
        XCTAssertEqual("Spent: ¥48", budgetDetailScreen.spentText.label)
        XCTAssertEqual("Remaining: ¥52", budgetDetailScreen.remainingText.label)
        // delete a transaction
        budgetDetailScreen.transactionList.children(matching: .cell).element(boundBy: 10).children(matching: .other).element(boundBy: 1).children(matching: .other).element.swipeLeft()
        XCTAssertTrue(budgetDetailScreen.transactionList.buttons["Delete"].waitForExistence(timeout: 10))
        budgetDetailScreen.transactionList.buttons["Delete"].tap()
        XCTAssertEqual("Spent: ¥0", budgetDetailScreen.spentText.label)
        XCTAssertEqual("Remaining: ¥100", budgetDetailScreen.remainingText.label)
    }
}
