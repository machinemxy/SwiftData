//
//  AdMovieScreen.swift
//  Movies
//
//  Created by Ma, Xueyuan on 2023/10/13.
//

import SwiftUI
import SwiftData

struct AdMovieScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State private var title = ""
    @State private var year: Int?
    @State private var selectedActors: Set<Actor> = []

    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)
            
            Section("Select Actors") {
                ActorSelectionView(selectedActors: $selectedActors)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    let movie = Movie(title: title, year: year ?? 0, actors: Array(selectedActors))
                    context.insert(movie)
                    dismiss()
                }
                .disabled(!isFormValid)
            }
        }
        .navigationTitle("Add Movie")
    }

    private var isFormValid: Bool {
        !title.isEmptyOrWhiteSpace && year != nil
    }
}

#Preview {
    NavigationStack {
        AdMovieScreen()
            .modelContainer(for: [Movie.self])
    }
}
