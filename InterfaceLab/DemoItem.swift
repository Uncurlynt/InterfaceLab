//
//  DemoItem.swift
//  InterfaceLab
//
//  Created by Артемий Андреев  on 27.03.2025.
//

import SwiftUI

enum DemoItem: String, CaseIterable, Identifiable, Hashable {
    case colorStack
    case colors
    case swiftUIColors
    case fonts
    case fontsWeight
    case fontsDesign
    case interactiveElements
    
    
    var id: String { rawValue }

    var title: String {
        switch self {
        case .colorStack:    return "Color Stack"
        case .colors:        return "Colors"
        case .swiftUIColors: return "SwiftUI Colors"
        case .fonts:         return "Fonts"
        case .fontsWeight:   return "Fonts Weight"
        case .fontsDesign:   return "Fonts Design"
        case .interactiveElements: return "Interactive"
        }
    }

    var systemImage: String {
        switch self {
        case .colorStack:    return "square.stack.3d.up"
        case .colors:        return "eyedropper"
        case .swiftUIColors: return "swatchpalette"
        case .fonts:         return "textformat"
        case .fontsWeight:   return "character.cursor.ibeam"
        case .fontsDesign:   return "textformat.abc"
        case .interactiveElements: return "wand.and.stars"

        }
    }
}

let demoList = DemoItem.allCases
