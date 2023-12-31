//
//  MockContainer.swift
//  SpendSmartTests
//
//  Created by 馬学渊 on 2023/12/31.
//

import Foundation
import SwiftData
@testable import SpendSmart

@MainActor
var mockContainer: ModelContainer {
    do {
        let container = try ModelContainer(for: BudgetCategory.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        return container
    } catch {
        fatalError(error.localizedDescription)
    }
}
