//
//  MovieListScreen.swift
//  Movies
//
//  Created by Ma, Xueyuan on 2023/10/13.
//

import SwiftUI
import SwiftData

struct MovieListScreen: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Movie.title, order: .reverse) private var movies: [Movie]
    @State private var isAddMoviePresented = false
    @State private var isAddActorPresented = false
    @State private var actorName = ""

    var body: some View {
        MovieListView(movies: movies)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Movie") {
                        isAddMoviePresented = true
                    }
                }

                ToolbarItem(placement: .topBarLeading) {
                    Button("Add Actor") {
                        isAddActorPresented = true
                    }
                }
            }
            .sheet(isPresented: $isAddMoviePresented, content: {
                NavigationStack {
                    AdMovieScreen()
                }
            })
            .sheet(isPresented: $isAddActorPresented, content: {
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
            })
    }

    private func saveActor() {
        let actor = Actor(name: actorName)
        context.insert(actor)
        actorName = ""
        isAddActorPresented = false
    }
}

#Preview {
    NavigationStack {
        MovieListScreen()
            .modelContainer(for: [Movie.self, Actor.self], inMemory: true)
    }
}
