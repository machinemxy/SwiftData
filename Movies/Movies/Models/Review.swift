//
//  Review.swift
//  Movies
//
//  Created by Ma, Xueyuan | Cecil | LIPD on 2023/10/18.
//

import Foundation
import SwiftData

@Model
final class Review {
    var subject: String
    var body: String
    var movie: Movie?

    init(subject: String, body: String, movie: Movie? = nil) {
        self.subject = subject
        self.body = body
        self.movie = movie
    }
}
