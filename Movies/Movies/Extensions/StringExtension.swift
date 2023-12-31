//
//  StringExtension.swift
//  Movies
//
//  Created by Ma, Xueyuan on 2023/10/13.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
