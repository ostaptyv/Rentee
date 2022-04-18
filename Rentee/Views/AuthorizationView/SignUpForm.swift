//
//  SignUpForm.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 28.03.2022.
//

import SwiftUI

struct SignUpForm: View {
    enum FieldType {
        case fullName
        case phoneNumber
        case password
        case confirmedPassword
    }
    @FocusState private var focusedField: FieldType?
    
    @Binding var fullName: String
    @Binding var phoneNumber: String
    @Binding var password: String
    @Binding var confirmedPassword: String
    
    let buttonSize: CGSize
    
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
            
            DataField(text: $phoneNumber, kind: .phoneNumber(country: .constant("🇺🇦")))
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
                print("Sign Up button tapped")
            }
            .buttonStyle(.mainAction(size: buttonSize))
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
    }
}

struct SignUpForm_Previews: PreviewProvider {
    static var previews: some View {
        SignUpForm(fullName: .constant(""),
                   phoneNumber: .constant(""),
                   password: .constant(""),
                   confirmedPassword: .constant(""),
                   buttonSize: CGSize(width: 184, height: 50))
    }
}
