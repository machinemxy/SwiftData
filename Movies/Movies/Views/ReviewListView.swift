//
//  ReviewListView.swift
//  Movies
//
//  Created by Ma, Xueyuan | Cecil | LIPD on 2023/10/19.
//

import SwiftUI
import SwiftData

struct ReviewListView: View {
    @Environment(\.modelContext) private var context
    let movie: Movie

    var body: some View {
        List {
            ForEach(movie.reviews) { review in
                VStack(alignment: .leading) {
                    Text(review.subject)
                    Text(review.body)
                        .font(.footnote)
                }
            }.onDelete(perform: deleteReview)
        }
    }

    private func deleteReview(indexSet: IndexSet) {
        indexSet.forEach { index in
            movie.reviews.remove(at: index)
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
