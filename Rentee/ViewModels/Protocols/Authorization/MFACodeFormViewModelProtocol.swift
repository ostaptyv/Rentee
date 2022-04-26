//
//  MFACodeFormViewModelProtocol.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import Foundation

protocol MFACodeFormViewModelProtocol: ObservableObject {
    var mfaCode: String { get set }
    var resendCodeTime: String { get set }
    
    func resendTapped()
    func codeFilled()
}
