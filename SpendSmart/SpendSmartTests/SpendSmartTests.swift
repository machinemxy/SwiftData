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
        budgetCategory = BudgetCategory(title: "Travel", amount: 300)
        try! budgetCategory.save(context: context)
    }
    
    func testThrowTitleExceptionWhenInsertingDuplicateBudgetCategory() throws {
        let newBudgetCategory = BudgetCategory(title: "Travel", amount: 300)
        XCTAssertThrowsError(try newBudgetCategory.save(context: context), "No exception was thrown") { error in
            if let error = error as? BudgetCategoryError {
                XCTAssertEqual(BudgetCategoryError.titleAlreadyExist, error)
            } else {
                XCTFail()
            }
        }
    }
}
