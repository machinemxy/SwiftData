//
//  Note.swift
//  GardenGreens
//
//  Created by Ma, Xueyuan on 2023/12/07.
//

import Foundation
import SwiftData

@Model
class Note {
    var text: String = ""
    var vegetable: Vegetable?

    init(text: String) {
        self.text = text
    }
}
