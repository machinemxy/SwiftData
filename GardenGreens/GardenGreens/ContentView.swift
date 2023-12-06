//
//  ContentView.swift
//  GardenGreens
//
//  Created by Ma, Xueyuan on 2023/12/06.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var vegetables: [Vegetable]
    @State private var name = ""

    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    guard !name.isEmpty else { return }
                    let vegetable = Vegetable(name: name)
                    context.insert(vegetable)
                    name = ""
                }

            List(vegetables) { vegetable in
                Text(vegetable.name)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Garden Greens")
    }
}

#Preview {
    NavigationStack {
        ContentView()
            .modelContainer(for: [Vegetable.self], inMemory: true)
    }
}
