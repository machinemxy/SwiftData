//
//  MovieListScreen.swift
//  Movies
//
//  Created by Ma, Xueyuan on 2023/10/13.
//

import SwiftUI
import SwiftData

fileprivate enum Sheet: String, Identifiable {
    case addMovie
    case addActor
    case showFilter

    var id: String { self.rawValue }
}

struct MovieListScreen: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Movie.year, order: .reverse) private var movies: [Movie]
    @Query(sort: \Actor.name, order: .forward) private var actors: [Actor]
    @State private var actorName = ""
    @State private var activeSheet: Sheet?

    var body: some View {
        List {
            Section("Movies") {
                ForEach(movies) { movie in
                    MovieView(movie: movie)
                }.onDelete(perform: deleteMovie)
            }

            Section("Actors") {
                ForEach(actors) { actor in
                    NavigationLink(value: actor) {
                        ActorCellView(actor: actor)
                    }
                }.onDelete(perform: deleteActor)
            }
        }
        .navigationDestination(for: Movie.self) { movie in
            MovieDetailScreen(movie: movie)
        }
        .navigationDestination(for: Actor.self, destination: { actor in
            ActorDetailScreen(actor: actor)
        })
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Add Movie") {
                    activeSheet = .addMovie
                }
            }

            ToolbarItem(placement: .topBarLeading) {
                Button("Add Actor") {
                    activeSheet = .addActor
                }
            }
        }
        .sheet(item: $activeSheet, content: { sheet in
            switch sheet {
            case .addMovie:
                NavigationStack {
                    AdMovieScreen()
                }
            case .addActor:
                VStack {
                    Text("Add Actor")
                        .font(.largeTitle)

                    TextField("Actor name", text: $actorName)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal)

                    Button("Save") {
                        saveActor()
                    }
                }.presentationDetents([.fraction(0.4)])
            case .showFilter:
                Text("Show Filter Screen")
            }
        })
    }

    private func saveActor() {
        let actor = Actor(name: actorName)
        context.insert(actor)
        actorName = ""
        activeSheet = nil
    }

    private func deleteMovie(indexSet: IndexSet) {
        indexSet.forEach { index in
            let movie = movies[index]
            context.delete(movie)
        }
    }

    private func deleteActor(indexSet: IndexSet) {
        indexSet.forEach { index in
            let actor = actors[index]
            context.delete(actor)
        }
    }
}

#Preview {
    NavigationStack {
        MovieListScreen()
            .modelContainer(for: [Movie.self, Actor.self], inMemory: true)
    }
}
