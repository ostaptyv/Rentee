//
//  SignUpRouter.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import SwiftUI

enum SignUpRoute: RouteType {
    case signUp
    case signIn
    case mfaCode
    
    static let initial: SignUpRoute = .signUp
}

struct SignUpRouter: RouterProtocol {
    @Binding var pictogram: PictogramType
    
    @ViewBuilder func view(for route: SignUpRoute) -> some View {
        switch route {
        case .signUp:
            SignUpForm<SignUpViewModel>()
            
        case .signIn:
            SignInView(pictogram: $pictogram)
            
        case .mfaCode:
            MFACodeForm<SignUpViewModel>()
        }
    }
}
