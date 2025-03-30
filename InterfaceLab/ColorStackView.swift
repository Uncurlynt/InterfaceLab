//
//  ColorStackView.swift
//  InterfaceLab
//
//  Created by Артемий Андреев  on 30.03.2025.
//

import SwiftUI

struct ColorStackView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Title (.label)")
                    .font(.headline)
                    .foregroundColor(Color(uiColor: .label))

                Text("Subtitle (.secondaryLabel)")
                    .font(.headline)
                    .foregroundColor(Color(uiColor: .secondaryLabel))

                Text("Placeholder (.tertiaryLabel)")
                    .font(.headline)
                    .foregroundColor(Color(uiColor: .tertiaryLabel))

                Text("Placeholder 🤷‍♂️ (.placeholderText)")
                    .font(.headline)
                    .foregroundColor(Color(uiColor: .placeholderText))

                Text("Disabled (.quaternaryLabel)")
                    .font(.headline)
                    .foregroundColor(Color(uiColor: .quaternaryLabel))

                Divider()
                    .background(Color(uiColor: .separator))

                Text(".systemBackground")
                    .font(.subheadline)

                VStack(alignment: .leading, spacing: 10) {
                    Text(".secondarySystemBackground")
                        .font(.subheadline)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(".tertiarySystemBackground")
                            .font(.subheadline)
                            .padding()
                            .background(Color(uiColor: .tertiarySystemBackground))
                            .cornerRadius(8)
                    }
                    .padding()
                    .background(Color(uiColor: .secondarySystemBackground))
                    .cornerRadius(8)

                }
                .padding()
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(8)

                Spacer()
            }
            .padding()
        }
        .background(Color(uiColor: .systemBackground))
        .navigationTitle("Color Stack")
    }
}
