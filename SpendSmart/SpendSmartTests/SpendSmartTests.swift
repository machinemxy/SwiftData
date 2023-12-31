//
//  SpendSmartTests.swift
//  SpendSmartTests
//
//  Created by 馬学渊 on 2023/12/31.
//

import XCTest
import SwiftData
@testable import SpendSmart

final class SpendSmartTests: XCTestCase {
    private var context: ModelContext!
    private var budgetCategory: BudgetCategory!
    
    @MainActor
    override func setUp() {
        context = mockContainer.mainContext
        budgetCategory = BudgetCategory(title: "Groceries", amount: 300)
        try! budgetCategory.save(context: context)
    }
    
    func testThrowTitleExceptionWhenInsertingDuplicateBudgetCategory() throws {
        let newBudgetCategory = BudgetCategory(title: "Groceries", amount: 300)
        XCTAssertThrowsError(try newBudgetCategory.save(context: context), "No exception was thrown") { error in
            if let error = error as? BudgetCategoryError {
                XCTAssertEqual(BudgetCategoryError.titleAlreadyExist, error)
            } else {
                XCTFail()
            }
        }
    }
    
    @MainActor
    func testCalculateTransactionsForBudget() {
        let transactions = [
            Transaction(title: "Milk", amount: 10, quantity: 1),
            Transaction(title: "Bread", amount: 2.5, quantity: 2),
            Transaction(title: "Eggs", amount: 4.75, quantity: 4)
        ]
        
        for transaction in transactions {
            budgetCategory.addTransaction(context: context, transaction: transaction)
        }
     
        XCTAssertEqual(34, budgetCategory.total)
        XCTAssertEqual(266, budgetCategory.remaining)
    }
}
