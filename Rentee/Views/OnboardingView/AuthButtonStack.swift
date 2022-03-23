//
//  AuthButtonStack.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 23.03.2022.
//

import SwiftUI

struct AuthButtonStack: View {
    let buttonSize: CGSize
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Button("Sing Up") {
                print("signUpButtonTaped")
            }
            .buttonStyle(.mainAction(size: buttonSize))
            
            Button("Sing in") {
                print("signInButtonTaped")
            }
            .buttonStyle(.sideAction(size: buttonSize))
        }
    }
}

struct AuthButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        AuthButtonStack(buttonSize: CGSize(width: 132, height: 50))
    }
}
