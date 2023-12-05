//
//  ContentView.swift
//  Rooms
//
//  Created by Ma, Xueyuan on 2023/11/20.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var context
    @Query private var rooms: [Room] = []
    @State private var name = ""
    @State private var color = Color.red

    var body: some View {
        VStack {
            TextField("Name", text: $name)
                .textFieldStyle(.roundedBorder)

            ColorSelectorView(selection: $color)

            Button(action: {
                let room = Room(name: name, color: UIColor(color))
                context.insert(room)
                name = ""
            }, label: {
                Text("Save")
                    .frame(maxWidth: .infinity)
            })
            .buttonStyle(.borderedProminent)
            .disabled(name.isEmpty)

            List(rooms) { room in
                HStack {
                    Text(room.name)
                    Spacer()
                    Rectangle()
                        .fill(Color(uiColor: room.color))
                        .frame(width: 50, height: 50)
                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                }
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [Room.self], inMemory: true)
}
