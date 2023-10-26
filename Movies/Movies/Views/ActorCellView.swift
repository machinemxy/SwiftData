//
//  ActorCellView.swift
//  Movies
//
//  Created by Ma, Xueyuan | Cecil | LIPD on 2023/10/26.
//

import SwiftUI

struct ActorCellView: View {
    let actor: Actor

    var body: some View {
        VStack(alignment: .leading, content: {
            Text(actor.name)
            Text(actor.movies.map { $0.title }, format: .list(type: .and))
                .font(.footnote)
        })
    }
}
