//
//  TodoItem.swift
//  TodoListSwiftData
//
//  Created by Ma, Xueyuan | Cecil | LIPD on 2024/01/22.
//

import Foundation
import SwiftData

@Model
final class TodoItem {
    var title: String

    init(title: String) {
        self.title = title
    }
}
