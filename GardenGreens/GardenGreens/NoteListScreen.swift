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
    @Query private var notes: [Note]
    let vegetable: Vegetable
    @State private var text = ""
    
    private var filteredNotes: [Note] {
        notes.filter { note in
            note.vegetable == vegetable
        }
    }

    var body: some View {
        VStack {
            TextField("Note Text", text: $text)
                .textFieldStyle(.roundedBorder)
                .onSubmit {
                    guard !text.isEmpty else { return }
                    let note = Note(text: text)
                    context.insert(note)
                    note.vegetable = vegetable
                    text = ""
                }
            
            List(filteredNotes) { note in
                Text(note.text)
            }

            Spacer()
        }
        .padding()
        .navigationTitle(vegetable.name)
    }
}

fileprivate struct NoteListScreenPreview: View {
    @Query private var vegetables: [Vegetable]
    
    var body: some View {
        NoteListScreen(vegetable: vegetables[0])
    }
}

#Preview { @MainActor in
    NavigationStack {
        NoteListScreenPreview()
    }
    .modelContainer(previewContainer)
}
