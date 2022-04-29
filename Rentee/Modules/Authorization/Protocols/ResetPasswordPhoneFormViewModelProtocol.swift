//
//  ResetPasswordPhoneFormViewModelProtocol.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import Foundation

protocol ResetPasswordPhoneFormViewModelProtocol: ObservableObject {
    var phoneNumber: String { get set }
    var countryEmoji: Character { get set }
    
    func sendCodeTapped()
}
