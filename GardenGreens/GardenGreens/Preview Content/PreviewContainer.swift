//
//  PreviewContainer.swift
//  GardenGreens
//
//  Created by 馬学渊 on 2023/12/07.
//

import Foundation
import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: Vegetable.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        SampleData.vegetables.forEach { vegetable in
            container.mainContext.insert(vegetable)
        }
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()

enum SampleData {
    static let vegetables: [Vegetable] = [Vegetable(name: "Tomato"), Vegetable(name: "Turnip"), Vegetable(name: "Onion")]
}
