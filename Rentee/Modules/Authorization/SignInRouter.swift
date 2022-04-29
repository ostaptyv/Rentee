//
//  SignInRouter.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import SwiftUI

enum SignInRoute: RouteType {
    case signIn
    case signUp
    
    // "Forgot your password?" flow
    case phoneNumber
    case mfaCode
    case newPassword
    
    static let initial: SignInRoute = .signIn
}

struct SignInRouter: RouterProtocol {
    @Binding var pictogram: PictogramType
    
    @ViewBuilder func view(for route: SignInRoute) -> some View {
        switch route {
        case .signIn:
            SignInForm<SignInViewModel>()
            
        case .signUp:
            SignUpView(pictogram: $pictogram)
            
        case .phoneNumber:
            ResetPasswordPhoneForm<SignInViewModel>()
            
        case .mfaCode:
            MFACodeForm<SignInViewModel>()
            
        case .newPassword:
            ResetPasswordNewPasswordForm<SignInViewModel>()
        }        
    }
}
