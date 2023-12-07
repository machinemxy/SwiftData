//
//  NoteListScreen.swift
//  GardenGreens
//
//  Created by Ma, Xueyuan on 2023/12/07.
//

import SwiftUI
import SwiftData

struct NoteListScreen: View {
    @Environment(\.modelContext) private var context
    @State private var text = ""

    var body: some View {
        VStack {
            TextField("Note Text", text: $text)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    guard !text.isEmpty else { return }
                    let note = Note(text: text)
                    context.insert(note)
                    text = ""
                }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    NoteListScreen()
        .modelContainer(for: [Vegetable.self], inMemory: true)
}
