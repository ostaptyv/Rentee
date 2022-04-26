//
//  ResetPasswordPhoneForm.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 21.04.2022.
//

import SwiftUI

struct ResetPasswordPhoneForm<ViewModel>: View where ViewModel: ResetPasswordPhoneFormViewModelProtocol {
    @EnvironmentObject  var viewModel: ViewModel
    
    @Environment(\.mainActionButtonSize) var mainActionButtonSize
    
    var body: some View {
        OperationDescription("We will send a code to your phone to reset your password.") {
            DataField(text: $viewModel.phoneNumber,
                      kind: .phoneNumber(country: $viewModel.countryEmoji))
                .title("Phone number")
                .prompt("Your phone number here")
                .errorMessage()
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .submitLabel(.next)
            
            Spacer(minLength: 20)
            
            Button("Send code") {
                viewModel.sendCodeTapped()
            }
            .buttonStyle(.mainAction(size: mainActionButtonSize))
        }
    }
}

struct ResetPasswordPhoneForm_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordPhoneForm<Stub.Authorization.ResetPasswordPhoneFormViewModel>()
            .environment(\.mainActionButtonSize, CGSize(width: 184, height: 50))
            .environmentObject(Stub.authorization.resetPasswordPhoneFormViewModel)
    }
}
