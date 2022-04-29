//
//  BackgroundSlide.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 23.03.2022.
//

import SwiftUI

extension AnyTransition {
    static var backgroundSlide: AnyTransition {
        .asymmetric(insertion:
                            .move(edge: .trailing)
                        .combined(with: .opacity),
                    removal:
                            .offset(x: 114, y: 0)
                        .combined(with: .opacity))
    }
}
