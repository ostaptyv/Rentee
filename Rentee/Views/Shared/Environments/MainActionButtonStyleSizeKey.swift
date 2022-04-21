//
//  MainActionButtonStyleSizeKey.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 21.04.2022.
//

import SwiftUI

struct MainActionButtonStyleSizeKey: EnvironmentKey {
    static var defaultValue: CGSize = .zero
}

extension EnvironmentValues {
    var mainActionButtonSize: CGSize {
        get {
            return self[MainActionButtonStyleSizeKey.self]
        }
        set {
            self[MainActionButtonStyleSizeKey.self] = newValue
        }
    }
}
