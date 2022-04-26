//
//  SignUpForm.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 28.03.2022.
//

import SwiftUI

struct SignUpForm<ViewModel>: View where ViewModel: SignUpFormViewModelProtocol {
    private enum FieldType {
        case fullName
        case phoneNumber
        case password
        case confirmedPassword
    }
    @FocusState private var focusedField: FieldType?
    
    @EnvironmentObject var viewModel: ViewModel
    
    @Environment(\.mainActionButtonSize) var mainActionButtonSize
    
    var body: some View {
        VStack(spacing: 20) {
            DataField(text: $viewModel.fullName)
                .title("Your full name")
                .prompt("E.g. John Smith")
                .errorMessage()
                .textContentType(.name)
                .keyboardType(.alphabet)
                .focused($focusedField, equals: .fullName)
                .submitLabel(.next)
            
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
                .textContentType(.newPassword)
                .keyboardType(.asciiCapable)
                .focused($focusedField, equals: .password)
                .submitLabel(.next)
            
            DataField(text: $viewModel.confirmedPassword, kind: .secureLookUp)
                .title("Retype your password")
                .prompt("Confirm password...")
                .errorMessage()
                .textContentType(.newPassword)
                .keyboardType(.asciiCapable)
                .focused($focusedField, equals: .confirmedPassword)
                .submitLabel(.done)
            
            Button("Sign Up") {
                viewModel.signUpTapped()
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
                viewModel.signInTapped()
            }
    }
}

struct SignUpForm_Previews: PreviewProvider {
    typealias PreviewSignUpForm = SignUpForm<Stubs.Authorization.SignUpFormViewModel>
    
    static var previews: some View {
        VStack(spacing: 0) {
            PreviewSignUpForm()
        }
        .environment(\.mainActionButtonSize, CGSize(width: 184, height: 50))
        .environmentObject(Stubs.authorization.signUpFormViewModel)
    }
}
