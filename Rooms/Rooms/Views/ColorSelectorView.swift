//
//  ColorSelectorView.swift
//  Rooms
//
//  Created by Ma, Xueyuan on 2023/12/04.
//

import SwiftUI

struct ColorSelectorView: View {
    @Binding var selection: Color
    let colors: [Color] = [.red, .orange, .purple, .blue, .yellow, .indigo]

    var body: some View {
        HStack {
            ForEach(colors, id: \.self) { color in
                Circle()
                    .fill(color)
                    .overlay(selection == color ? Circle().stroke(.black, lineWidth: 2) : nil)
                    .onTapGesture {
                        selection = color
                    }
            }
        }
    }
}

#Preview {
    ColorSelectorView(selection: .constant(.red))
}
