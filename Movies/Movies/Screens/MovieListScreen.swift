//
//  MovieListScreen.swift
//  Movies
//
//  Created by Ma, Xueyuan on 2023/10/13.
//

import SwiftUI
import SwiftData

struct MovieListScreen: View {
    @Query(sort: \Movie.title, order: .reverse) private var movies: [Movie]
    @State private var isAddMoviePresented = false

    var body: some View {
        MovieListView(movies: movies)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Movie") {
                        isAddMoviePresented = true
                    }
                }
            }
            .sheet(isPresented: $isAddMoviePresented, content: {
                NavigationStack {
                    AdMovieScreen()
                }
            })
    }
}

#Preview {
    NavigationStack {
        MovieListScreen()
            .modelContainer(for: [Movie.self])
    }
}
