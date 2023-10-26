//
//  Movie.swift
//  Movies
//
//  Created by Ma, Xueyuan on 2023/10/13.
//

import Foundation
import SwiftData

@Model
final class Movie {
    var title: String
    var year: Int
    @Relationship(deleteRule: .cascade, inverse: \Review.movie) var reviews: [Review] = []
    @Relationship(deleteRule: .nullify, inverse: \Actor.movies) var actors: [Actor] = []

    init(title: String, year: Int, actors: [Actor]) {
        self.title = title
        self.year = year
        self.actors = actors
    }
}
