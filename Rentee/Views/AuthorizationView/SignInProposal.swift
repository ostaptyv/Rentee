//
//  SignInProposal.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 28.03.2022.
//

import SwiftUI

struct SignInProposal: View {
    private var onSignInClosure: (() -> Void)?
    
    var body: some View {
        HStack(spacing: 0) {
            Text("Already have an account? ")
                .font(R.font.notoSansRegular.font(size: 12))
                .foregroundColor(Color(hex: "7583A0"))
            
            Button("Sign in") {
                onSignInClosure?()
            }
            .buttonStyle(.textButton)
        }
    }
    
    // MARK: - Modifiers
    
    func onSignIn(_ closure: @escaping () -> Void) -> SignInProposal {
        var view = self
        view.onSignInClosure = closure
        
        return view
    }
}

struct SignInProposal_Previews: PreviewProvider {
    static var previews: some View {
        SignInProposal()
    }
}
