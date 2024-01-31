//
//  Font+Extensions.swift
//  KFCSWIFTUI
//
//  Created by Rohit Lama on 16/02/2023.
//

import SwiftUI

extension Font {
    
    /// Defined type for font weight
    enum FontWeight {
        case regular,
             medium,
             semiBold,
             bold,
             custom(name: String)
        
        var value: String {
            switch self {
            case .regular:
                return "Poppins-Regular"
            case .medium:
                return "Poppins-Medium"
            case .semiBold:
                return "Poppins-SemiBold"
            case .bold:
                return "Poppins-Bold"
            case .custom(let name):
                return name
            }
        }
    }
    
    /// Helper function for custom font
    /// - Parameters:
    ///   - weight: takes enum to specify font weight
    ///   - size: takes font size
    /// - Returns: Font
    static func custom(_ weight: FontWeight, size: CGFloat) -> Font {
        return .custom(weight.value, size: size)
    }
    
}

/**
 
 # Add this to info [Open as Source Code]
 
 <key>UIAppFonts</key>
     <array>
         <string><#FontFamily#>-Bold.ttf</string>
         <string><#FontFamily#>-SemiBold.ttf</string>
         <string><#FontFamily#>-Medium.ttf</string>
         <string><#FontFamily#>-Regular.ttf</string>
     </array>
 
 **/

