//
//  MovieDetailScreen.swift
//  Movies
//
//  Created by Ma, Xueyuan on 2023/10/17.
//

import SwiftUI
import SwiftData

struct MovieDetailScreen: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    let movie: Movie

    @State private var title = ""
    @State private var year: Int?

    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("year", value: $year, format: .number)
        }.onAppear(perform: {
            title = movie.title
            year = movie.year
        })
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Update") {
                    movie.title = title
                    movie.year = year ?? 0
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
        .navigationTitle("Movie Detail")
    }

    private var isFormValid: Bool {
        !title.isEmptyOrWhiteSpace && year != nil
    }
}
