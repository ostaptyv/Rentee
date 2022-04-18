//
//  TextButtonStyle.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 18.04.2022.
//

import SwiftUI

struct TextButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(R.font.notoSansBold.font(size: 12))
            .foregroundColor(Color(hex: "3545B1"))
    }
}

extension ButtonStyle where Self == TextButtonStyle {
    static var textButton: Self {
        return Self()
    }
}
