//
//  Room.swift
//  Rooms
//
//  Created by Ma, Xueyuan on 2023/11/20.
//

import UIKit
import SwiftData

@Model
final class Room {
    var name: String
    @Attribute(.transformable(by: UIColorValueTransformer.self)) var color: UIColor

    init(name: String, color: UIColor) {
        self.name = name
        self.color = color
    }
}
