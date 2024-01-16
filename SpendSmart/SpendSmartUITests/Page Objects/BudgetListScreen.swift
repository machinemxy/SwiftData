//
//  BudgetListScreen.swift
//  SpendSmartUITests
//
//  Created by Ma, Xueyuan | Cecil | LIPD on 2024/01/16.
//

import Foundation
import XCTest

struct BudgetListScreen {
    let app: XCUIApplication

    lazy var addBudgetCategoryButton: XCUIElement = {
        app.buttons["AddBudgetCategoryButton"]
    }()

    lazy var budgetCategoryList: XCUIElement = {
        app.collectionViews["budgetCategoryList"]
    }()
}
