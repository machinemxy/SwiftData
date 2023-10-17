//
//  MovieListView.swift
//  Movies
//
//  Created by Ma, Xueyuan on 2023/10/16.
//

import SwiftUI
import SwiftData

struct MovieListView: View {
    @Environment(\.modelContext) private var context
    let movies: [Movie]

    var body: some View {
        List {
            ForEach(movies) { movie in
                NavigationLink(value: movie) {
                    HStack {
                        Text(movie.title)
                        Spacer()
                        Text(movie.year.description)
                    }
                }
            }.onDelete(perform: deleteMovie)
        }.navigationDestination(for: Movie.self) { movie in
            MovieDetailScreen(movie: movie)
        }
    }

    private func deleteMovie(indexSet: IndexSet) {
        indexSet.forEach { index in
            let movie = movies[index]
            context.delete(movie)
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

#Preview {
    MovieListView(movies: [])
}
