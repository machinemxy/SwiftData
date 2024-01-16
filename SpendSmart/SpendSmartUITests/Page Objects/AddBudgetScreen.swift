//
//  AddBudgetScreen.swift
//  SpendSmartUITests
//
//  Created by Ma, Xueyuan | Cecil | LIPD on 2024/01/16.
//

import Foundation
import XCTest

struct AddBudgetScreen {
    let app: XCUIApplication

    lazy var titleTextField: XCUIElement = {
        app.textFields["titleTextField"]
    }()

    lazy var amountTextField: XCUIElement = {
        app.textFields["amountTextField"]
    }()

    lazy var saveBudgetCategoryButton: XCUIElement = {
        app.buttons["saveBudgetCategoryButton"]
    }()
}
