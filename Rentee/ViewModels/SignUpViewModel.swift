//
//  SignUpViewModel.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import Foundation

class SignUpViewModel: ViewModelProtocol,
                       SignUpFormViewModelProtocol,
                       MFACodeFormViewModelProtocol {
    
    @Published var route: SignUpRoute? = .initial
    
    @Published var pictogram: PictogramType = .renteeLogo
    
    @Published var fullName: String = ""
    @Published var phoneNumber: String = ""
    @Published var countryEmoji: Character = "🏳"
    @Published var password: String = ""
    @Published var confirmedPassword: String = ""
    
    @Published var mfaCode: String = ""
    @Published var resendCodeTime: String = ""
    
    func signUpTapped() {
        route = .mfaCode
        pictogram = .verify
    }
    func signInTapped() {
        route = .signIn
    }
    
    func resendTapped() {
        mfaCode = ""
    }
    func codeFilled() {
        print("You are on Home!")
    }
}
