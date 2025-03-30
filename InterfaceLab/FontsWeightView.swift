//
//  FontsWeightView.swift
//  InterfaceLab
//
//  Created by Артемий Андреев  on 27.03.2025.
//

import SwiftUI

struct FontsWeightView: View {
    private let weights: [(String, UIFont.Weight)] = [
        ("Ultra Light", .ultraLight),
        ("Thin", .thin),
        ("Light", .light),
        ("Regular", .regular),
        ("Medium", .medium),
        ("Semibold", .semibold),
        ("Bold", .bold),
        ("Heavy", .heavy),
        ("Black", .black)
    ]

    var body: some View {
        List {
            ForEach(weights, id: \.0) { item in
                let (name, uiKitWeight) = item
                let descriptor = UIFont.systemFont(ofSize: 17, weight: uiKitWeight).fontDescriptor
                let traits = descriptor.object(forKey: .traits) as? [UIFontDescriptor.TraitKey: Any]
                let fontWeightValue = (traits?[.weight] as? NSNumber)?.floatValue ?? 0.0

                VStack(alignment: .leading) {
                    Text(name)
                        .font(.system(size: 17, weight: toSwiftUIFontWeight(uiKitWeight)))
                    
                    Text("Font weight: \(fontWeightValue)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Fonts Weight")
    }
}

fileprivate func toSwiftUIFontWeight(_ uiFontWeight: UIFont.Weight) -> Font.Weight {
    switch uiFontWeight {
    case .ultraLight: return .ultraLight
    case .thin:       return .thin
    case .light:      return .light
    case .regular:    return .regular
    case .medium:     return .medium
    case .semibold:   return .semibold
    case .bold:       return .bold
    case .heavy:      return .heavy
    case .black:      return .black
    default:          return .regular
    }
}
