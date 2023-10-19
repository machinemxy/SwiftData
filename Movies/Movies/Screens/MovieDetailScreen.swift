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
    @State private var showReviewScreen = false

    var body: some View {
        Form {
            TextField("Title", text: $title)
            TextField("Year", value: $year, format: .number)

            Section("Reviews") {
                Button("Add Review") {
                    showReviewScreen = true
                }

                if movie.reviews.isEmpty {
                    ContentUnavailableView {
                        Text("No Reviews")
                    }
                } else {
                    ReviewListView(movie: movie)
                }
            }
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
        .sheet(isPresented: $showReviewScreen) {
            NavigationStack {
                AddReviewScreen(movie: movie)
            }
        }
    }

    private var isFormValid: Bool {
        !title.isEmptyOrWhiteSpace && year != nil
    }
}
