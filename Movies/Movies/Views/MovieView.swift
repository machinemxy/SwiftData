//
//  MovieView.swift
//  Movies
//
//  Created by Ma, Xueyuan on 2023/10/16.
//

import SwiftUI
import SwiftData

struct MovieView: View {
    let movie: Movie

    var body: some View {
        NavigationLink(value: movie) {
            HStack {
                Text(movie.title)
                Spacer()
                Text(movie.year.description)
            }
        }
    }
}
