//
//  SwiftUIColorsView.swift
//  InterfaceLab
//
//  Created by Артемий Андреев  on 27.03.2025.
//

import SwiftUI


struct SwiftUIColorsView: View {
    let colors: [(String, Color)] = [
        (".accentColor", .accentColor),
        (".red", .red),
        (".orange", .orange),
        (".yellow", .yellow),
        (".green", .green),
        (".mint", .mint),
        (".teal", .teal),
        (".cyan", .cyan),
        (".blue", .blue),
        (".indigo", .indigo),
        (".purple", .purple),
        (".pink", .pink),
        (".brown", .brown),
        (".white", .white),
        (".gray", .gray),
        (".black", .black),
        (".clear", .clear),
        (".primary", .primary),
        (".secondary", .secondary)
    ]

    var body: some View {
        List {
            ForEach(colors, id: \.0) { name, c in
                ZStack {
                    Rectangle()
                        .fill(c)
                    Text(name)
                        .foregroundColor(c == .white || c == .clear ? .black : .white)
                }
                .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .navigationTitle("SwiftUI Colors")
    }
}
