//
//  Furniture.swift
//  StoringImages
//
//  Created by Ma, Xueyuan | Cecil | LIPD on 2024/01/24.
//

import Foundation
import SwiftData

@Model
final class Furniture {
    var photo: Data?

    init(photo: Data? = nil) {
        self.photo = photo
    }
}
