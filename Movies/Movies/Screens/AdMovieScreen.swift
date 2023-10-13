//
//  AdMovieScreen.swift
//  Movies
//
//  Created by Ma, Xueyuan | Cecil | LIPD on 2023/10/13.
//

import SwiftUI
import SwiftData

struct AdMovieScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State private var title = ""
    @State private var year: Int?

    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    let movie = Movie(title: title, year: year ?? 0)
                    context.insert(movie)
                    do {
                        try context.save()
                    } catch {
                        print(error.localizedDescription)
                    }
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
