//
//  ContentView.swift
//  Rooms
//
//  Created by Ma, Xueyuan on 2023/11/20.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var color = Color.red

    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)
            ColorSelectorView(selection: $color)
            Button(action: {

            }, label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
