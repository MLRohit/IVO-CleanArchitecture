//
//  Color+Extensions.swift
//  KFCSWIFTUI
//
//  Created by Rohit Lama on 16/02/2023.
//

import SwiftUI

extension Color {

    // MARK: - Modifiers
    
    init(hexString: String, alpha: CGFloat = 1) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, opacity: CGFloat(a) / 255)
    }
    
    var components: (r: Double, g: Double, b: Double, o: Double)? {
        let uiColor: UIColor
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var o: CGFloat = 0

        if self.description.contains("NamedColor") {
            let lowerBound = self.description.range(of: "name: \"")!.upperBound
            let upperBound = self.description.range(of: "\", bundle")!.lowerBound
            let assetsName = String(self.description[lowerBound..<upperBound])

            uiColor = UIColor(named: assetsName)!
        } else {
            uiColor = UIColor(self)
        }

        guard uiColor.getRed(&r, green: &g, blue: &b, alpha: &o) else { return nil }
        return (Double(r), Double(g), Double(b), Double(o))
    }

    func interpolateTo(color: Color, fraction: Double) -> Color {
        let s = self.components!
        let t = color.components!

        let r: Double = s.r + (t.r - s.r) * fraction
        let g: Double = s.g + (t.g - s.g) * fraction
        let b: Double = s.b + (t.b - s.b) * fraction
        let o: Double = s.o + (t.o - s.o) * fraction

        return Color(red: r, green: g, blue: b, opacity: o)
    }
    
}
