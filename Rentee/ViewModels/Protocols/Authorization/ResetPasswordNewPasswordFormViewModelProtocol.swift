//
//  ResetPasswordNewPasswordFormViewModelProtocol.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import Foundation

protocol ResetPasswordNewPasswordFormViewModelProtocol: ObservableObject {
    var password: String { get set }
    var confirmedPassword: String { get set }
    
    func signInTapped()
}
