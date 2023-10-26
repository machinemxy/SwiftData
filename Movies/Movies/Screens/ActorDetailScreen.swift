//
//  ActorDetailScreen.swift
//  Movies
//
//  Created by Ma, Xueyuan | Cecil | LIPD on 2023/10/26.
//

import SwiftUI
import SwiftData

struct ActorDetailScreen: View {
    @Environment(\.dismiss) private var dismiss
    @Query(sort: \Movie.year, order: .reverse) private var movies: [Movie]
    let actor: Actor
    @State var selectedMovies = Set<Movie>()

    var body: some View {
        List(movies) { movie in
            HStack {
                Image(systemName: selectedMovies.contains(movie) ? "checkmark.square" : "square")
                    .onTapGesture {
                        if !selectedMovies.contains(movie) {
                            selectedMovies.insert(movie)
                        } else {
                            selectedMovies.remove(movie)
                        }
                    }
                Text(movie.title)
            }
        }
        .navigationTitle(actor.name)
        .onAppear(perform: {
            selectedMovies = Set(actor.movies)
        })
        .toolbar(content: {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    actor.movies = Array(selectedMovies)
                    dismiss()
                }
            }
        })
    }
}
