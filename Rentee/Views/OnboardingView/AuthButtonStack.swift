//
//  AuthButtonStack.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 23.03.2022.
//

import SwiftUI

struct AuthButtonStack: View {
    @Environment(\.mainActionButtonSize) var mainActionButtonSize
    @Environment(\.sideActionButtonSize) var sideActionButtonSize
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Button("Sing Up") {
                print("signUpButtonTaped")
            }
            .buttonStyle(.mainAction(size: mainActionButtonSize))
            
            Button("Sing in") {
                print("signInButtonTaped")
            }
            .buttonStyle(.sideAction(size: sideActionButtonSize))
        }
    }
}

struct AuthButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        AuthButtonStack()
            .environment(\.mainActionButtonSize, CGSize(width: 132, height: 50))
            .environment(\.sideActionButtonSize, CGSize(width: 132, height: 50))
    }
}
