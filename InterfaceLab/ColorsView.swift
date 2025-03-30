//
//  ColorsView.swift
//  InterfaceLab
//
//  Created by Артемий Андреев  on 27.03.2025.
//

import SwiftUI

fileprivate struct ColorRow: Identifiable {
    let id = UUID()
    let name: String
    let background: UIColor
    let textColor: UIColor?
}

fileprivate struct ColorSection: Identifiable {
    let id = UUID()
    let header: String
    let rows: [ColorRow]
}

fileprivate func buildColorSections() -> [ColorSection] {
    var sections = [ColorSection]()

    let adaptableColors = [
        ColorRow(name: ".systemRed",    background: .systemRed,    textColor: nil),
        ColorRow(name: ".systemGreen",  background: .systemGreen,  textColor: nil),
        ColorRow(name: ".systemBlue",   background: .systemBlue,   textColor: nil),
        ColorRow(name: ".systemIndigo", background: .systemIndigo, textColor: nil),
        ColorRow(name: ".systemOrange", background: .systemOrange, textColor: nil),
        ColorRow(name: ".systemPink",   background: .systemPink,   textColor: nil),
        ColorRow(name: ".systemPurple", background: .systemPurple, textColor: nil),
        ColorRow(name: ".systemTeal",   background: .systemTeal,   textColor: nil),
        ColorRow(name: ".systemYellow", background: .systemYellow, textColor: nil),
    ]

    var newAdaptableColorsIOS15 = [ColorRow]()
    if #available(iOS 15.0, *) {
        newAdaptableColorsIOS15 = [
            ColorRow(name: ".systemMint",   background: .systemMint,   textColor: nil),
            ColorRow(name: ".systemCyan",   background: .systemCyan,   textColor: nil),
            ColorRow(name: ".systemBrown",  background: .systemBrown,  textColor: nil)
        ]
    }

    let grays = [
        ColorRow(name: ".systemGray",  background: .systemGray,  textColor: nil),
        ColorRow(name: ".systemGray2", background: .systemGray2, textColor: nil),
        ColorRow(name: ".systemGray3", background: .systemGray3, textColor: nil),
        ColorRow(name: ".systemGray4", background: .systemGray4, textColor: nil),
        ColorRow(name: ".systemGray5", background: .systemGray5, textColor: nil),
        ColorRow(name: ".systemGray6", background: .systemGray6, textColor: nil),
    ]

    let labelColors = [
        ColorRow(name: ".label",            background: .white, textColor: .label),
        ColorRow(name: ".secondaryLabel",   background: .white, textColor: .secondaryLabel),
        ColorRow(name: ".tertiaryLabel",    background: .white, textColor: .tertiaryLabel),
        ColorRow(name: ".quaternaryLabel",  background: .white, textColor: .quaternaryLabel),
    ]

    let textColors = [
        ColorRow(name: ".placeholderText",  background: .white, textColor: .placeholderText)
    ]

    let linkColor = [
        ColorRow(name: ".link",             background: .white, textColor: .link)
    ]

    let separators = [
        ColorRow(name: ".separator",        background: .separator,        textColor: .label),
        ColorRow(name: ".opaqueSeparator",  background: .opaqueSeparator,  textColor: .label)
    ]

    let fillColors = [
        ColorRow(name: ".systemFill",            background: .systemFill,            textColor: nil),
        ColorRow(name: ".secondarySystemFill",   background: .secondarySystemFill,   textColor: nil),
        ColorRow(name: ".tertiarySystemFill",    background: .tertiarySystemFill,    textColor: nil),
        ColorRow(name: ".quaternarySystemFill",  background: .quaternarySystemFill,  textColor: nil)
    ]

    let backgroundColors = [
        ColorRow(name: ".systemBackground",            background: .systemBackground,            textColor: nil),
        ColorRow(name: ".secondarySystemBackground",   background: .secondarySystemBackground,   textColor: nil),
        ColorRow(name: ".tertiarySystemBackground",    background: .tertiarySystemBackground,    textColor: nil)
    ]

    let groupedBackgroundColors = [
        ColorRow(name: ".systemGroupedBackground",            background: .systemGroupedBackground,            textColor: nil),
        ColorRow(name: ".secondarySystemGroupedBackground",   background: .secondarySystemGroupedBackground,   textColor: nil),
        ColorRow(name: ".tertiarySystemGroupedBackground",    background: .tertiarySystemGroupedBackground,    textColor: nil)
    ]

    let nonadaptableColors = [
        ColorRow(name: ".lightText", background: .black, textColor: .lightText),
        ColorRow(name: ".darkText",  background: .white, textColor: .darkText)
    ]

    if #available(iOS 15.0, *) {
        let tintColors = [
            ColorRow(name: ".tintColor", background: .tintColor, textColor: .white)
        ]
        sections.append(ColorSection(header: "Tint Colors", rows: tintColors))
    }

    sections.append(ColorSection(header: "Adaptable Colors", rows: adaptableColors))
    if !newAdaptableColorsIOS15.isEmpty {
        sections.append(ColorSection(header: "Adaptable Colors for iOS 15", rows: newAdaptableColorsIOS15))
    }
    sections.append(ColorSection(header: "Adaptable Grays", rows: grays))
    sections.append(ColorSection(header: "Label Colors", rows: labelColors))
    sections.append(ColorSection(header: "Text Colors", rows: textColors))
    sections.append(ColorSection(header: "Link Color", rows: linkColor))
    sections.append(ColorSection(header: "Separators", rows: separators))
    sections.append(ColorSection(header: "Fill Colors", rows: fillColors))
    sections.append(ColorSection(header: "Background Colors", rows: backgroundColors))
    sections.append(ColorSection(header: "Grouped Background Colors", rows: groupedBackgroundColors))

    return sections
}

struct ColorsView: View {
    private let sections = buildColorSections()

    var body: some View {
        List {
            ForEach(sections) { section in
                Section(header: Text(section.header)) {
                    ForEach(section.rows) { row in
                        Text(row.name)
                            .foregroundColor(Color(uiColor: row.textColor ?? .label))
                            .listRowBackground(Color(uiColor: row.background))
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Colors")
    }
}
