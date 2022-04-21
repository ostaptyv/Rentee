//
//  SignUpForm.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 28.03.2022.
//

import SwiftUI

struct SignUpForm: View {
    private enum FieldType {
        case fullName
        case phoneNumber
        case password
        case confirmedPassword
    }
    @FocusState private var focusedField: FieldType?
    
    @Binding var fullName: String
    @Binding var phoneNumber: String
    @Binding var countryEmoji: Character
    @Binding var password: String
    @Binding var confirmedPassword: String
    
    @Environment(\.mainActionButtonSize) var mainActionButtonSize
    
    private var onSignUpClosure: (() -> Void)?
    private var onSignInClosure: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 20) {
            DataField(text: $fullName)
                .title("Your full name")
                .prompt("E.g. John Smith")
                .errorMessage()
                .textContentType(.name)
                .keyboardType(.alphabet)
                .focused($focusedField, equals: .fullName)
                .submitLabel(.next)
            
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
                .textContentType(.newPassword)
                .keyboardType(.asciiCapable)
                .focused($focusedField, equals: .password)
                .submitLabel(.next)
            
            DataField(text: $confirmedPassword, kind: .secureLookUp)
                .title("Retype your password")
                .prompt("Confirm password...")
                .errorMessage()
                .textContentType(.newPassword)
                .keyboardType(.asciiCapable)
                .focused($focusedField, equals: .confirmedPassword)
                .submitLabel(.done)
            
            Button("Sign Up") {
                onSignUpClosure?()
            }
            .buttonStyle(.mainAction(size: mainActionButtonSize))
        }
        .onSubmit {
            switch focusedField! {
            case .fullName:
                focusedField = .phoneNumber
            case .phoneNumber:
                focusedField = .password
            case .password:
                focusedField = .confirmedPassword
            case .confirmedPassword:
                focusedField = nil
            }
        }
        
        Spacer()
            .frame(maxHeight: 15)
        
        SignInProposal()
            .onSignIn {
                onSignInClosure?()
            }
    }
    
    // MARK: - Modifiers
    
    func onSignUp(_ closure: @escaping () -> Void) -> SignUpForm {
        var view = self
        view.onSignUpClosure = closure
        
        return view
    }
    func onSignIn(_ closure: @escaping () -> Void) -> SignUpForm {
        var view = self
        view.onSignInClosure = closure
        
        return view
    }
    
    // MARK: - Initializers
    
    init(fullName: Binding<String>,
         phoneNumber: Binding<String>,
         countryEmoji: Binding<Character>,
         password: Binding<String>,
         confirmedPassword: Binding<String>) {
        
        self._fullName = fullName
        self._phoneNumber = phoneNumber
        self._countryEmoji = countryEmoji
        self._password = password
        self._confirmedPassword = confirmedPassword
    }
}

struct SignUpForm_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            SignUpForm(fullName: .constant(""),
                       phoneNumber: .constant(""),
                       countryEmoji: .constant("🇺🇦"),
                       password: .constant(""),
                       confirmedPassword: .constant(""))
        }
        .environment(\.mainActionButtonSize, CGSize(width: 184, height: 50))
    }
}
