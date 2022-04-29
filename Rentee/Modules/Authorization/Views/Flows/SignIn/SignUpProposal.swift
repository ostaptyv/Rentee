//
//  SignUpProposal.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 21.04.2022.
//

import SwiftUI

struct SignUpProposal: View {
    private var onSignUpClosure: (() -> Void)?
    
    var body: some View {
        HStack(spacing: 0) {
            Text("Don’t have an account? ")
                .font(R.font.notoSansRegular.font(size: 12))
                .foregroundColor(Color(hex: "7583A0"))
            
            Button("Sign up") {
                onSignUpClosure?()
            }
            .buttonStyle(.textButton)
        }
    }
    
    // MARK: - Modifiers
    
    func onSignUp(_ closure: @escaping () -> Void) -> SignUpProposal {
        var view = self
        view.onSignUpClosure = closure
        
        return view
    }
}

struct SignUpProposal_Previews: PreviewProvider {
    static var previews: some View {
        SignUpProposal()
    }
}
