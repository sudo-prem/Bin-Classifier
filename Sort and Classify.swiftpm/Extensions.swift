//
//  Extensions.swift
//  Sort and Classify
//
//  Created by Premnaath Varadharajan on 08/04/22.
//

import SwiftUI

// Extending String class to capitalize first letter
extension String {
    public func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    public mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

// Extending Color class to pass HEX code for a color
extension Color {
    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
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
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// Extending UIButton to animate when pressed
extension UIButton {
    
    public func animate() {
        let casa = CASpringAnimation(keyPath: "transform.scale")
        casa.duration = 0.4
        casa.fromValue = 0.98
        casa.toValue = 1.0
        casa.autoreverses = false
        casa.repeatCount = 0
        casa.initialVelocity = 0.5
        layer.add(casa, forKey: nil)
    }
}

// Extending String to use subscript operator
extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
