//
//  CornerRadiusMaskModifier.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 17.04.2022.
//

import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: Corner.Set) -> some View {
        clipShape(RoundedCornersRectangle(radius: radius, corners: corners))
    }
}
