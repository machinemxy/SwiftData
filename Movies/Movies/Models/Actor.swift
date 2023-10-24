//
//  Actor.swift
//  Movies
//
//  Created by Ma, Xueyuan | Cecil | LIPD on 2023/10/24.
//

import Foundation
import SwiftData

@Model
final class Actor {
    var name: String
    var movies: [Movie] = []

    init(name: String) {
        self.name = name
    }
}
