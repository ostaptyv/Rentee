//
//  SignInForm.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 21.04.2022.
//

import SwiftUI

struct SignInForm<ViewModel>: View where ViewModel: SignInFormViewModelProtocol {
    private enum FieldType {
        case phoneNumber
        case password
    }
    
    @FocusState private var focusedField: FieldType?
    
    @EnvironmentObject var viewModel: ViewModel
    
    @Environment(\.mainActionButtonSize) var mainActionButtonSize
    
    var body: some View {
        VStack(spacing: 20) {
            DataField(text: $viewModel.phoneNumber,
                      kind: .phoneNumber(country: $viewModel.countryEmoji))
                .title("Phone number")
                .prompt("Your phone number here")
                .errorMessage()
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .focused($focusedField, equals: .phoneNumber)
                .submitLabel(.next)
            
            DataField(text: $viewModel.password, kind: .secureLookUp)
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
                viewModel.forgotPasswordTapped()
            }
            .buttonStyle(.textButton)
            
            Spacer()
        }
        
        Spacer(minLength: 20)
        Button("Sign In") {
            viewModel.signInTapped()
        }
        .buttonStyle(.mainAction(size: mainActionButtonSize))
        
        Spacer(minLength: 15)
        SignUpProposal()
            .onSignUp {
                viewModel.signUpTapped()
            }
    }
}

struct SignInForm_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            SignInForm<Stub.Authorization.SignInFormViewModel>()
        }
        .environment(\.mainActionButtonSize, CGSize(width: 184, height: 50))
        .environmentObject(Stub.authorization.signInFormViewModel)
    }
}
