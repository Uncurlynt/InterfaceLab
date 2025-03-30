//
//  InteractiveElementsView.swift
//  InterfaceLab
//
//  Created by Артемий Андреев  on 27.03.2025.
//

import SwiftUI

enum CustomMaterial: String, CaseIterable, Equatable, Identifiable {
    case ultraThin, thin, regular, thick, ultraThick

    var id: String { rawValue }

    var swiftUIMaterial: Material {
        switch self {
        case .ultraThin: return .ultraThinMaterial
        case .thin: return .thinMaterial
        case .regular: return .regularMaterial
        case .thick: return .thickMaterial
        case .ultraThick: return .ultraThickMaterial
        }
    }

    var displayName: String {
        switch self {
        case .ultraThin: return "UltraThin"
        case .thin: return "Thin"
        case .regular: return "Regular"
        case .thick: return "Thick"
        case .ultraThick: return "UltraThick"
        }
    }
}

struct InteractiveElementsView: View {
    @State private var fontSize: CGFloat = 20
    @State private var isDark: Bool = false
    @State private var blurAmount: CGFloat = 0
    @State private var iconIndex = 0
    @State private var bgColor: Color = .blue
    @State private var textColor: Color = .white
    @State private var materialStyle: CustomMaterial = .thin
    @State private var materialOpacity: Double = 1.0

    let icons = ["sun.max.fill", "cloud.fill", "moon.fill", "wind.snow"]

    var body: some View {
        ScrollView {
            VStack(spacing: 30) {

                VStack(spacing: 10) {
                    Text("Изменяемый текст")
                        .font(.system(size: fontSize))
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .animation(.easeInOut, value: fontSize)

                    Text("Размер: \(Int(fontSize)) pt")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    Slider(value: $fontSize, in: 10...50, step: 1)
                        .padding(.horizontal)
                }

                Divider()

                VStack(spacing: 10) {
                    Text("Размытие: \(String(format: "%.1f", blurAmount))")
                    Image(systemName: "swift")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(20)
                        .blur(radius: blurAmount)
                        .animation(.easeInOut, value: blurAmount)

                    Slider(value: $blurAmount, in: 0...10)
                        .padding(.horizontal)
                }

                Divider()

                VStack(spacing: 10) {
                    Text("Цветной пример")
                        .font(.headline)
                        .padding()
                        .background(bgColor)
                        .foregroundColor(textColor)
                        .cornerRadius(12)
                        .shadow(radius: 5)

                    ColorPicker("Фон", selection: $bgColor)
                    ColorPicker("Текст", selection: $textColor)
                }
                .padding()

                Divider()

                VStack(spacing: 10) {
                    Text("Материал: \(materialStyle.displayName)")
                        .font(.headline)

                    ZStack {
                        WavyBackground()
                            .frame(height: 200)
                            .cornerRadius(12)

                        Image(systemName: icons[iconIndex])
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding()
                            .background(materialStyle.swiftUIMaterial)
                            .opacity(materialOpacity)
                            .cornerRadius(20)

                    }

                    Picker("Стиль материала", selection: $materialStyle) {
                        ForEach(CustomMaterial.allCases) { material in
                            Text(material.displayName).tag(material)
                        }
                    }
                    .pickerStyle(.segmented)

                    HStack {
                        Text("Прозрачность: \(String(format: "%.2f", materialOpacity))")
                        Slider(value: $materialOpacity, in: 0...1)
                    }
                    .padding(.horizontal)
                }
                .padding()
            }
            .padding()
        }
        .navigationTitle("Interactive")
        .preferredColorScheme(isDark ? .dark : .light)
    }
}

struct WavyBackground: View {
    @State private var animateWave = false
    @State private var animateGradient = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: animateGradient ?
                                   [Color.purple, Color.indigo, Color.teal] :
                                   [Color.orange, Color.pink, Color.purple]),
                startPoint: animateGradient ? .topLeading : .bottomLeading,
                endPoint: animateGradient ? .bottomTrailing : .topTrailing
            )
            .ignoresSafeArea()
            .animation(.easeInOut(duration: 8).repeatForever(autoreverses: true), value: animateGradient)

            
        }
        .onAppear {
            animateWave.toggle()
            animateGradient.toggle()
        }
    }
}
