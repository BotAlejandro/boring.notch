//
//  CodableColor.swift
//  boringNotch
//
//  Created by Codex AI on 2024-11-24.
//

import SwiftUI
import Defaults
import AppKit

struct CodableColor: Codable, Defaults.Serializable {
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double

    init(nsColor: NSColor) {
        let color = nsColor.usingColorSpace(.sRGB) ?? nsColor
        red = Double(color.redComponent)
        green = Double(color.greenComponent)
        blue = Double(color.blueComponent)
        alpha = Double(color.alphaComponent)
    }

    init(color: Color) {
        #if os(macOS)
        self.init(nsColor: NSColor(color))
        #else
        self.init(nsColor: NSColor(Color.white))
        #endif
    }

    var swiftUIColor: Color {
        Color(red: red, green: green, blue: blue, opacity: alpha)
    }

    var nsColor: NSColor {
        NSColor(calibratedRed: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
    }
}

extension Color {
    static var systemAccent: Color {
        #if os(macOS)
        Color(nsColor: NSColor.controlAccentColor)
        #else
        .accentColor
        #endif
    }
}
