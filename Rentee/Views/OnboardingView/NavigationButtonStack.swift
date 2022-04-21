//
//  NavigationButtonStack.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 23.03.2022.
//

import SwiftUI

struct NavigationButtonStack: View {
    @Binding var selection: Int
    let tabsCount: Int
    
    @Environment(\.mainActionButtonSize) var mainActionButtonSize
    @Environment(\.sideActionButtonSize) var sideActionButtonSize
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            if selection > 0 {
                Button("Back") {
                    print("Button Back pressed")
                    withAnimation {
                        if selection > 0 {
                            selection -= 1
                        }
                    }
                }
                .buttonStyle(.sideAction(size: mainActionButtonSize))
                .transition(.backgroundSlide)
            }
            
            Button("Next") {
                print("Button Next pressed")
                withAnimation {
                    if selection < tabsCount - 1 {
                        selection += 1
                    }
                }
            }
            .buttonStyle(.mainAction(size: sideActionButtonSize))
        }
    }
}

struct NavigationButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            NavigationButtonStack(selection: .constant(0),
                                  tabsCount: 6)
            NavigationButtonStack(selection: .constant(2),
                                  tabsCount: 6)
        }
        .environment(\.mainActionButtonSize, CGSize(width: 132, height: 50))
        .environment(\.sideActionButtonSize, CGSize(width: 132, height: 50))
    }
}
