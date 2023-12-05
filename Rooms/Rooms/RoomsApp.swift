//
//  RoomsApp.swift
//  Rooms
//
//  Created by Ma, Xueyuan on 2023/11/20.
//

import SwiftUI
import SwiftData

@main
struct RoomsApp: App {
    init() {
        ValueTransformer.setValueTransformer(UIColorValueTransformer(), forName: NSValueTransformerName("UIColorValueTransformer"))
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [Room.self])
        }
    }
}
