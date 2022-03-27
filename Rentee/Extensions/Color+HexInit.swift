//
//  UIColor+HexInit.swift
//  currenc.io
//
//  Created by Ostap on 03.04.2020.
//  Copyright © 2020 Ostap Tyvonovych. All rights reserved.
//

import SwiftUI

extension Color {
    public init?(_ colorSpace: Color.RGBColorSpace = .sRGB, hex: String, opacity: CGFloat = 1) {
        let red, green, blue: CGFloat
        var hex = hex
        
        if hex.hasPrefix("#") {
            hex.removeFirst()
        }
        
        guard hex.count == 6 else {
            return nil
        }
        
        let scanner = Scanner(string: hex)
        var hexNumber: UInt64 = 0
        
        guard scanner.scanHexInt64(&hexNumber) else {
            return nil
        }
        
        red = CGFloat((hexNumber & 0xff0000) >> 16) / 255
        green = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
        blue = CGFloat(hexNumber & 0x0000ff) / 255
        
        self.init(colorSpace, red: red, green: green, blue: blue, opacity: opacity)
    }
}

extension UIColor {
    convenience init(light: UIColor, dark: UIColor) {
        self.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .light, .unspecified:
                return light
            case .dark:
                return dark
            @unknown default:
                return light
            }
        }
    }
}

extension Color {
    init(light: Color, dark: Color) {
        self.init(UIColor(light: UIColor(light), dark: UIColor(dark)))
    }
}
