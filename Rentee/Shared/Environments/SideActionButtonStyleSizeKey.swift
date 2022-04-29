//
//  SideActionButtonStyleSizeKey.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 21.04.2022.
//

import SwiftUI

struct SideActionButtonStyleSizeKey: EnvironmentKey {
    static var defaultValue: CGSize = .zero
}

extension EnvironmentValues {
    var sideActionButtonSize: CGSize {
        get {
            return self[SideActionButtonStyleSizeKey.self]
        }
        set {
            self[SideActionButtonStyleSizeKey.self] = newValue
        }
    }
}
