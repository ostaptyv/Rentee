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
    let buttonSize: CGSize
    
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
                .buttonStyle(.sideAction(size: buttonSize))
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
            .buttonStyle(.mainAction(size: buttonSize))
        }
    }
}

struct NavigationButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            NavigationButtonStack(selection: .constant(0),
                                  tabsCount: 6,
                                  buttonSize: CGSize(width: 132, height: 50))
            NavigationButtonStack(selection: .constant(2),
                                  tabsCount: 6,
                                  buttonSize: CGSize(width: 132, height: 50))
        }
    }
}
