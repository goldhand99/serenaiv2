//
//  Colours.swift
//  Seren AI FrontEnd
//
//  Created by Pop Lorenzo on 03.04.2025.
//

import Foundation
import SwiftUI



extension Color {
    static let backgroundPrimary = Color(hex: "#3C2FD2")
    static let logoCircle = Color(hex: "#3C2FD2").opacity(0.5)
    static let secondLogoCircle = Color(hex:"#2D269C")
    static let logoPetal = Color(hex: "#151643").opacity(0.5)
    static let whiteShadow = Color.white
}


// MARK: - Hex Color Extension
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255

        self.init(red: r, green: g, blue: b)
    }
}
