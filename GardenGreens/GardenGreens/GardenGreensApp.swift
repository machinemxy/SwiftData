//
//  GardenGreensApp.swift
//  GardenGreens
//
//  Created by Ma, Xueyuan on 2023/12/06.
//

import SwiftUI

@main
struct GardenGreensApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
            }
        }
        .modelContainer(for: [Vegetable.self])
    }
}
