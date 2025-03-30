//
//  FontsView.swift
//  InterfaceLab
//
//  Created by Артемий Андреев  on 27.03.2025.
//

import SwiftUI

struct FontsView: View {
    private let fontStyles: [(String, UIFont.TextStyle)] = [
        (".largeTitle", .largeTitle),
        (".title1", .title1),
        (".title2", .title2),
        (".title3", .title3),
        (".headline", .headline),
        (".subheadline", .subheadline),
        (".body", .body),
        (".callout", .callout),
        (".footnote", .footnote),
        (".caption1", .caption1),
        (".caption2", .caption2)
    ]

    var body: some View {
        List(fontStyles, id: \.0) { item in
            let (name, style) = item
            let uiFont = UIFont.preferredFont(forTextStyle: style)
            let pointSize = Int(uiFont.pointSize)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.init(style))
                Text("Point Size: \(pointSize)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
        .listStyle(.plain)
        .navigationTitle("Fonts")
    }
}

extension Font {
    init(_ textStyle: UIFont.TextStyle) {
        switch textStyle {
        case .largeTitle:
            self = .largeTitle
        case .title1:
            self = .title
        case .title2:
            self = .title2
        case .title3:
            self = .title3
        case .headline:
            self = .headline
        case .subheadline:
            self = .subheadline
        case .body:
            self = .body
        case .callout:
            self = .callout
        case .footnote:
            self = .footnote
        case .caption1:
            self = .caption
        case .caption2:
            self = .caption2
        default:
            self = .body
        }
    }
}
