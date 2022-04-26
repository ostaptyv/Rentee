//
//  ResetPasswordNewPasswordForm.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 21.04.2022.
//

import SwiftUI

struct ResetPasswordNewPasswordForm<ViewModel>: View where ViewModel: ResetPasswordNewPasswordFormViewModelProtocol {
    private enum FieldType {
        case newPassword
        case confirmedPassword
    }
    @FocusState private var focusedField: FieldType?
    
    @EnvironmentObject var viewModel: ViewModel
    
    @Environment(\.mainActionButtonSize) var mainActionButtonSize
    
    var body: some View {
        VStack(spacing: 20) {
            DataField(text: $viewModel.password, kind: .secureLookUp)
                .title("New password")
                .prompt("Password...")
                .errorMessage()
                .textContentType(.newPassword)
                .keyboardType(.asciiCapable)
                .focused($focusedField, equals: .newPassword)
                .submitLabel(.next)
            
            DataField(text: $viewModel.confirmedPassword, kind: .secureLookUp)
                .title("Retype your password")
                .prompt("Confirm password...")
                .errorMessage()
                .textContentType(.newPassword)
                .keyboardType(.asciiCapable)
                .focused($focusedField, equals: .confirmedPassword)
                .submitLabel(.done)
            
            Button("Sign In") {
                viewModel.signInTapped()
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
}

struct ResetPasswordNewPasswordForm_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordNewPasswordForm<Stub.Authorization.ResetPasswordNewPasswordFormViewModel>()
            .environment(\.mainActionButtonSize, CGSize(width: 184, height: 50))
            .environmentObject(Stub.authorization.resetPasswordNewPasswordFormViewModel)
    }
}
