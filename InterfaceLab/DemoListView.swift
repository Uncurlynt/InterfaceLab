//
//  DemoListView.swift
//  InterfaceLab
//
//  Created by Артемий Андреев  on 27.03.2025.
//

import SwiftUI

struct DemoListView: View {
    @Binding var selectedDemo: DemoItem?
    @Binding var isDarkMode: Bool

    var body: some View {
        List(selection: $selectedDemo) {
            Section {
                Toggle("Dark Mode", isOn: $isDarkMode)
            }

            Section {
                ForEach(demoList) { demo in
                    NavigationLink(value: demo) {
                        HStack {
                            Image(systemName: demo.systemImage)
                            Text(demo.title)
                        }
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
        .navigationTitle("Interface Lab")
    }
}
