//
//  SignInViewModel.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import Foundation

class SignInViewModel: ViewModelProtocol,
                       SignInFormViewModelProtocol,
                       ResetPasswordPhoneFormViewModelProtocol,
                       ResetPasswordNewPasswordFormViewModelProtocol,
                       MFACodeFormViewModelProtocol {
    
    @Published var route: SignInRoute? = .initial
    
    @Published var pictogram: PictogramType = .renteeLogo
    
    @Published var phoneNumber: String = ""
    @Published var password: String = ""
    @Published var countryEmoji: Character = "🏳"
    
    @Published var mfaCode: String = ""
    @Published var resendCodeTime: String = ""
    
    @Published var newPassword: String = ""
    @Published var confirmedPassword: String = ""
    
    func signInTapped() {
        print("You are on Home!")
    }
    func forgotPasswordTapped() {
        route = .phoneNumber
        pictogram = .resetPassword
    }
    func signUpTapped() {
        route = .signUp
    }
    
    func sendCodeTapped() {
        route = .mfaCode
        pictogram = .verify
    }
    
    func resendTapped() {
        mfaCode = ""
    }
    func codeFilled() {
        route = .newPassword
        pictogram = .resetPassword
    }
}
