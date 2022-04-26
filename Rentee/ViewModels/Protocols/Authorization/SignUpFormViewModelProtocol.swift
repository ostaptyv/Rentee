//
//  SignUpFormViewModelProtocol.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import Foundation

protocol SignUpFormViewModelProtocol: ObservableObject {
    var fullName: String { get set }
    var phoneNumber: String { get set }
    var countryEmoji: Character { get set }
    var password: String { get set }
    var confirmedPassword: String { get set }
    
    func signUpTapped()
    func signInTapped()
}
