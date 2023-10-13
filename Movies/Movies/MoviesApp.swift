//
//  MoviesApp.swift
//  Movies
//
//  Created by Ma, Xueyuan on 2023/10/13.
//

import SwiftUI
import SwiftData

@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MovieListScreen()
            }
        }
        .modelContainer(for: [Movie.self])
    }
}
