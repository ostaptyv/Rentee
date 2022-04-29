//
//  StatusBarStyleModifier.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 28.03.2022.
//

import SwiftUI

#if canImport(UIKit)
struct StatusBarStyleModifier: ViewModifier {
    let style: ColorScheme
    
    func body(content: Content) -> some View {
        content
            .onAppear {
                var uiStyle: UIStatusBarStyle

                switch style {
                case .light:
                    uiStyle = .lightContent
                case .dark:
                    uiStyle = .darkContent
                @unknown default:
                    fatalError("Unknown color scheme detected")
                }
                
                UIApplication.shared.statusBarStyle = uiStyle
            }
            .onDisappear {
                UIApplication.shared.statusBarStyle = .default
            }
    }
}

extension View {
    func statusBarStyle(_ style: ColorScheme) -> some View {
        self.modifier(StatusBarStyleModifier(style: style))
    }
}
#endif
