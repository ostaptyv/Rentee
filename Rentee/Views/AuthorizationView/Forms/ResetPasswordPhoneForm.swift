//
//  ResetPasswordPhoneForm.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 21.04.2022.
//

import SwiftUI

struct ResetPasswordPhoneForm: View {
    @Binding var phoneNumber: String
    @Binding var countryEmoji: Character
    
    private var onSendCodeClosure: (() -> Void)?
    
    var body: some View {
        OperationDescription("We will send a code to your phone to reset your password.") {
            DataField(text: $phoneNumber, kind: .phoneNumber(country: $countryEmoji))
                .title("Phone number")
                .prompt("Your phone number here")
                .errorMessage()
                .textContentType(.telephoneNumber)
                .keyboardType(.phonePad)
                .submitLabel(.next)
            
            Spacer(minLength: 20)
            
            Button("Send code") {
                onSendCodeClosure?()
            }
        }
    }
    
    // MARK: - Modifiers
    
    func onSendCode(_ closure: @escaping () -> Void) -> ResetPasswordPhoneForm {
        var view = self
        view.onSendCodeClosure = closure
        
        return view
    }
    
    // MARK: - Initializers
    
    init(phoneNumber: Binding<String>,
         countryEmoji: Binding<Character>) {
        
        self._phoneNumber = phoneNumber
        self._countryEmoji = countryEmoji
    }
}

struct ResetPasswordPhoneForm_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordPhoneForm(phoneNumber: .constant(""),
                               countryEmoji: .constant("🇺🇦"))
    }
}
