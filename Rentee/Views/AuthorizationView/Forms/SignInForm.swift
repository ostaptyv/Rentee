//
//  SignInForm.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 21.04.2022.
//

import SwiftUI

struct SignInForm: View {
    private enum FieldType {
        case phoneNumber
        case password
    }
    
    @FocusState private var focusedField: FieldType?
    
    @Binding var phoneNumber: String
    @Binding var countryEmoji: Character
    @Binding var password: String
    
    private var onSignUpClosure: (() -> Void)?
    private var onSignInClosure: (() -> Void)?
    private var onPasswordResetClosure: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 20) {
            DataField(text: $phoneNumber, kind: .phoneNumber(country: $countryEmoji))
                .title("Phone number")
                .prompt("Your phone number here")
                .errorMessage()
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .focused($focusedField, equals: .phoneNumber)
                .submitLabel(.next)
            
            DataField(text: $password, kind: .secureLookUp)
                .title("Password")
                .prompt("Password...")
                .errorMessage()
                .textContentType(.password)
                .keyboardType(.asciiCapable)
                .focused($focusedField, equals: .password)
                .submitLabel(.done)
            
        }
        .onSubmit {
            switch focusedField! {
            case .phoneNumber:
                focusedField = .password
            case .password:
                focusedField = nil
            }
        }
        
        Spacer(minLength: 15)
        HStack {
            Button("Forgot your password?") {
                onPasswordResetClosure?()
            }
            .buttonStyle(.textButton)
            
            Spacer()
        }
        
        Spacer(minLength: 20)
        Button("Sign In") {
            onSignInClosure?()
        }
        
        Spacer(minLength: 15)
        SignUpProposal()
            .onSignUp {
                onSignUpClosure?()
            }
    }
    
    // MARK: - Modifiers
    
    func onSignUp(_ closure: @escaping () -> Void) -> SignInForm {
        var view = self
        view.onSignUpClosure = closure
        
        return view
    }
    func onSignIn(_ closure: @escaping () -> Void) -> SignInForm {
        var view = self
        view.onSignInClosure = closure
        
        return view
    }
    func onPasswordReset(_ closure: @escaping () -> Void) -> SignInForm {
        var view = self
        view.onPasswordResetClosure = closure
        
        return view
    }
    
    // MARK: - Initializers
    
    init(phoneNumber: Binding<String>,
         countryEmoji: Binding<Character>,
         password: Binding<String>) {
        
        self._phoneNumber = phoneNumber
        self._countryEmoji = countryEmoji
        self._password = password
    }
}

struct SignInForm_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            SignInForm(phoneNumber: .constant(""),
                       countryEmoji: .constant("🇺🇦"),
                       password: .constant(""))
        }
        .buttonStyle(.mainAction(size: CGSize(width: 184, height: 50)))
    }
}
