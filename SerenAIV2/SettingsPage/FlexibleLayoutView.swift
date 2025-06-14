//
//  FlexibleLayoutView.swift
//  SerenAIV2
//
//  Created by Pop Lorenzo on 22.04.2025.
//

import Foundation
import SwiftUI

struct FlexibleView<Data: Collection, Content: View>: View where Data.Element: Identifiable {
    let data: Data
    let spacing: CGFloat
    let alignment: HorizontalAlignment
    let content: (Data.Element) -> Content
    @State private var totalHeight: CGFloat = .zero
    @State private var totalWidth: CGFloat = .zero



    init(
        data: Data,
        spacing: CGFloat = 8,
        alignment: HorizontalAlignment = .leading,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.data = data
        self.spacing = spacing
        self.alignment = alignment
        self.content = content
    }

    var body: some View {
        GeometryReader { geometry in
        
                self.generateContent(in: geometry)
        
        }.frame(height: totalHeight)
    }
    
    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        GeometryReader { geometry -> Color in
            DispatchQueue.main.async {
                binding.wrappedValue = geometry.size.height
            }
            return Color.clear
        }
    }
    
    private func viewWidthReader(_ binding: Binding<CGFloat>) -> some View {
        GeometryReader { geometry -> Color in
            DispatchQueue.main.async {
                binding.wrappedValue = geometry.size.width
            }
            return Color.clear
        }
    }

    private func generateContent(in geometry: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var rows: [[Data.Element]] = [[]]

        for item in data {
            let itemSize = UIHostingController(rootView: content(item)).view!.intrinsicContentSize

            if width + itemSize.width + spacing > geometry.size.width {
                width = 0
                rows.append([item])
            } else {
                rows[rows.count - 1].append(item)
            }

            width += itemSize.width + spacing
        }

        return VStack(alignment: alignment, spacing: spacing) {
            ForEach(rows.indices, id: \.self) { rowIndex in
                HStack(spacing: spacing) {
                    ForEach(rows[rowIndex]) { item in
                        content(item)
                    }
                }
            }
        }.background(viewHeightReader($totalHeight))
           
    }
}

