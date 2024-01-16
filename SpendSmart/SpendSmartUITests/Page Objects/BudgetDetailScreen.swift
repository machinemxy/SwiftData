//
//  BudgetDetailScreen.swift
//  SpendSmartUITests
//
//  Created by Ma, Xueyuan | Cecil | LIPD on 2024/01/16.
//

import Foundation
import XCTest

struct BudgetDetailScreen {
    var app: XCUIApplication

    lazy var transactionTitleTextField: XCUIElement = {
        app.textFields["transactionTitleTextField"]
    }()

    lazy var transactionAmountTextField: XCUIElement = {
        app.textFields["transactionAmountTextField"]
    }()

    lazy var transactionQuantityTextField: XCUIElement = {
        app.textFields["transactionQuantityTextField"]
    }()

    lazy var addTransactionButton: XCUIElement = {
        app.buttons["addTransactionButton"]
    }()

    lazy var spentText: XCUIElement = {
        app.staticTexts["spentText"]
    }()

    lazy var remainingText: XCUIElement = {
        app.staticTexts["remainingText"]
    }()

    lazy var transactionList: XCUIElement = {
        app.collectionViews["transactionList"]
    }()
}
