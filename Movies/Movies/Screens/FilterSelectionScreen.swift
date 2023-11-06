//
//  FilterSelectionScreen.swift
//  Movies
//
//  Created by Ma, Xueyuan on 2023/11/06.
//

import SwiftUI

enum FilterOption {
    case title(String)
    case none
}

struct FilterSelectionScreen: View {
    @Environment(\.dismiss) private var dismiss
    @State private var movieTitle = ""
    @Binding var filterOption: FilterOption

    var body: some View {
        Form {
            Section("Filter By Title") {
                TextField("Movie Title", text: $movieTitle)
                Button("Search") {
                    if movieTitle.isEmpty {
                        filterOption = .none
                    } else {
                        filterOption = .title(movieTitle)
                    }
                    dismiss()
                }
            }
        }
    }
}
