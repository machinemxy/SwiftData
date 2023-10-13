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

    init(title: String, year: Int) {
        self.title = title
        self.year = year
    }
}
