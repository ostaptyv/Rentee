//
//  ActionButtonStyle.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 17.03.2022.
//

import SwiftUI

struct ActionButtonStyle: ButtonStyle {
    var backgroundColor: Color
    var foregroundColor: Color
    var size: CGSize
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: size.width, height: size.height)
            .background(backgroundColor)
            .foregroundColor(foregroundColor)
            .font(R.font.notoSansSemiBold.font(size: 14))
            .clipShape(RoundedRectangle(cornerRadius: 14))
    }
}

extension ButtonStyle where Self == ActionButtonStyle {
    static func mainAction(size: CGSize) -> Self {
        return Self(
            backgroundColor: Color(hex: "3545B1")!,
            foregroundColor: .white,
            size: size
        )
    }
    static func sideAction(size: CGSize) -> Self {
        return Self(
            backgroundColor: Color(hex: "F9F9FB")!,
            foregroundColor: Color(hex: "7878A0")!,
            size: size
        )
    }
}
