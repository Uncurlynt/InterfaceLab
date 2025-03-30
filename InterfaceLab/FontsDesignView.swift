//
//  FontsDesignView.swift
//  InterfaceLab
//
//  Created by Артемий Андреев  on 27.03.2025.
//

import SwiftUI

struct FontsDesignView: View {
    @State private var fontSize: CGFloat = 17

    private let designs: [(String, UIFontDescriptor.SystemDesign)] = [
        (".default", .default),
        (".rounded", .rounded),
        (".serif", .serif),
        (".monospaced", .monospaced)
    ]

    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Text("Font Size: \(Int(fontSize))")
                Button(action: decreaseFontSize) {
                    Text("-")
                        .font(.system(size: 25))
                }
                Button(action: increaseFontSize) {
                    Text("+")
                        .font(.system(size: 25))
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(uiColor: .systemGray6))

            List {
                ForEach(designs, id: \.0) { (name, design) in
                    if let fontDescriptor = UIFontDescriptor
                        .preferredFontDescriptor(withTextStyle: .body)
                        .withDesign(design) {

                        let uiFont = UIFont(descriptor: fontDescriptor, size: fontSize)
                        
                        VStack(alignment: .leading) {
                            Text(name)
                                .font(.init(uiFont))
                            Text("Point Size: \(Int(uiFont.pointSize))")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
        .navigationTitle("Fonts Design")
    }

    private func increaseFontSize() {
        guard fontSize < 100 else {
            fontSize = 17
            return
        }
        fontSize += 1
    }

    private func decreaseFontSize() {
        guard fontSize > 0 else {
            fontSize = 17
            return
        }
        fontSize -= 1
    }
}

extension Font {
    init(_ uiFont: UIFont) {
        self = .custom(uiFont.fontName, size: uiFont.pointSize)
    }
}
