//
//  ResetPasswordNewPasswordForm.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 21.04.2022.
//

import SwiftUI

struct ResetPasswordNewPasswordForm: View {
    private enum FieldType {
        case newPassword
        case confirmedPassword
    }
    @FocusState private var focusedField: FieldType?
    
    @Binding var password: String
    @Binding var confirmedPassword: String
    
    @Environment(\.mainActionButtonSize) var mainActionButtonSize
    
    private var onSignInClosure: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 20) {
            DataField(text: $password, kind: .secureLookUp)
                .title("New password")
                .prompt("Password...")
                .errorMessage()
                .textContentType(.newPassword)
                .keyboardType(.asciiCapable)
                .focused($focusedField, equals: .newPassword)
                .submitLabel(.next)
            
            DataField(text: $confirmedPassword, kind: .secureLookUp)
                .title("Retype your password")
                .prompt("Confirm password...")
                .errorMessage()
                .textContentType(.newPassword)
                .keyboardType(.asciiCapable)
                .focused($focusedField, equals: .confirmedPassword)
                .submitLabel(.done)
            
            Button("Sign In") {
                onSignInClosure?()
            }
            .buttonStyle(.mainAction(size: mainActionButtonSize))
        }
        .onSubmit {
            switch focusedField! {
            case .newPassword:
                focusedField = .confirmedPassword
            case .confirmedPassword:
                focusedField = nil
            }
        }
    }
    
    // MARK: - Modifiers
    
    func onSignIn(_ closure: @escaping () -> Void) -> ResetPasswordNewPasswordForm {
        var view = self
        view.onSignInClosure = closure
        
        return view
    }
    
    // MARK: - Initializers
    
    init(password: Binding<String>,
         confirmedPassword: Binding<String>) {
        
        self._password = password
        self._confirmedPassword = confirmedPassword
    }
}

struct ResetPasswordNewPasswordForm_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordNewPasswordForm(password: .constant(""),
                                     confirmedPassword: .constant(""))
        .environment(\.mainActionButtonSize, CGSize(width: 184, height: 50))
    }
}
