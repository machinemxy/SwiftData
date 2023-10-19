//
//  AddReviewScreen.swift
//  Movies
//
//  Created by Ma, Xueyuan | Cecil | LIPD on 2023/10/18.
//

import SwiftUI
import SwiftData

struct AddReviewScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    let movie: Movie
    @State private var subject = ""
    @State private var description = ""

    var body: some View {
        Form {
            TextField("Subject", text: $subject)
            TextField("Body", text: $description)
        }
        .navigationTitle("Add Review")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }

            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    let review = Review(subject: subject, body: description)
                    movie.reviews.append(review)
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
    }

    private var isFormValid: Bool {
        !subject.isEmptyOrWhiteSpace && !description.isEmptyOrWhiteSpace
    }
}
