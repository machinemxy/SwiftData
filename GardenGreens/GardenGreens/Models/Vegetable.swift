//
//  Vegetable.swift
//  GardenGreens
//
//  Created by Ma, Xueyuan on 2023/12/06.
//

import Foundation
import SwiftData

@Model
class Vegetable {
    var name: String = ""
    @Relationship(deleteRule: .cascade) var notes: [Note]?

    init(name: String) {
        self.name = name
    }
}
