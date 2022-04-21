//
//  ConditionalButtonStack.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 23.03.2022.
//

import SwiftUI

struct ConditionalButtonStack: View {
    @Binding var selection: Int
    let tabsCount: Int
    let buttonSize = CGSize(width: 132, height: 50)
    
    var body: some View {
        Group {
            if selection != tabsCount - 1 {
                NavigationButtonStack(selection: $selection,
                                      tabsCount: tabsCount)
            } else {
                AuthButtonStack()
            }
        }
        .environment(\.mainActionButtonSize, buttonSize)
        .environment(\.sideActionButtonSize, buttonSize)
    }
}

struct ConditionalButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            ConditionalButtonStack(selection: .constant(0), tabsCount: 6)
            ConditionalButtonStack(selection: .constant(2), tabsCount: 6)
            ConditionalButtonStack(selection: .constant(5), tabsCount: 6)
        }
    }
}
