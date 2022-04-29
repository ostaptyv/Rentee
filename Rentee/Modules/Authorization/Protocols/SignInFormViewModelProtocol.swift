//
//  SignInFormViewModelProtocol.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import Foundation

protocol SignInFormViewModelProtocol: ObservableObject {
    var phoneNumber: String { get set }
    var countryEmoji: Character { get set }
    var password: String { get set }
    
    func signUpTapped()
    func signInTapped()
    func forgotPasswordTapped()
}
