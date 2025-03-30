//
//  InterfaceLabApp.swift
//  InterfaceLab
//
//  Created by Артемий Андреев  on 27.03.2025.
//

import SwiftUI

@main
struct InterfaceLab: App {
    @State private var selectedDemo: DemoItem? = nil
    @State private var isDarkMode: Bool = false

    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                DemoListView(selectedDemo: $selectedDemo, isDarkMode: $isDarkMode)
            } detail: {
                if let demo = selectedDemo {
                    detailView(for: demo)
                } else {
                    Text("Выберите демо из списка")
                        .foregroundColor(.secondary)
                        .font(.headline)
                }
            }
            .preferredColorScheme(isDarkMode ? .dark : .light)
            .navigationSplitViewStyle(.automatic)
        }
    }
    
    @ViewBuilder
    private func detailView(for item: DemoItem) -> some View {
        switch item {
        case .colorStack:
            ColorStackView()
        case .colors:
            ColorsView()
        case .swiftUIColors:
            SwiftUIColorsView()
        case .fonts:
            FontsView()
        case .fontsWeight:
            FontsWeightView()
        case .fontsDesign:
            FontsDesignView()
        case .interactiveElements:
            InteractiveElementsView()
        }
    }
}
