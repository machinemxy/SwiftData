//
//  ActorSelectionView.swift
//  Movies
//
//  Created by Ma, Xueyuan | Cecil | LIPD on 2023/10/26.
//

import SwiftUI
import SwiftData

struct ActorSelectionView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Actor.name, order: .forward) private var actors: [Actor]
    @Binding var selectedActors: Set<Actor>

    var body: some View {
        List(actors) { actor in
            HStack {
                Image(systemName: selectedActors.contains(actor) ? "checkmark.square" : "square")
                    .onTapGesture {
                        if !selectedActors.contains(actor) {
                            selectedActors.insert(actor)
                        } else {
                            selectedActors.remove(actor)
                        }
                    }
                Text(actor.name)
            }
        }
    }
}

#Preview {
    ActorSelectionView(selectedActors: .constant([]))
        .modelContainer(for: [Actor.self], inMemory: true)
}
