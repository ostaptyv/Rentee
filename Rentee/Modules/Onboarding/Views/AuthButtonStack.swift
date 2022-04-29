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
    
    @EnvironmentObject var viewModel: OnboardingViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Button("Sign Up") {
                viewModel.route = .signUp
            }
            .buttonStyle(.mainAction(size: mainActionButtonSize))
            
            Button("Sign in") {
                viewModel.route = .signIn
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
