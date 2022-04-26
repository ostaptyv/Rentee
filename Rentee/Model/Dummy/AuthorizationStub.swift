//
//  AuthorizationStub.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import Foundation

extension Stub {
    struct authorization {
        static let signUpFormViewModel = Authorization.SignUpFormViewModel()
        static let signInFormViewModel = Authorization.SignInFormViewModel()
        static let resetPasswordPhoneFormViewModel = Authorization.ResetPasswordPhoneFormViewModel()
        static let resetPasswordNewPasswordFormViewModel = Authorization.ResetPasswordNewPasswordFormViewModel()
        static let mfaCodeFormViewModel = Authorization.MFACodeFormViewModel()
    }
    
    struct Authorization {
        class SignUpFormViewModel: SignUpFormViewModelProtocol {
            var fullName: String = ""
            var phoneNumber: String = ""
            var countryEmoji: Character = "🇺🇦"
            var password: String = ""
            var confirmedPassword: String = ""
            
            func signUpTapped() {
                
            }
            func signInTapped() {
                
            }
        }
        class SignInFormViewModel: SignInFormViewModelProtocol {
            var phoneNumber: String = ""
            var countryEmoji: Character = "🇺🇦"
            var password: String = ""
            
            func signUpTapped() {
                
            }
            func signInTapped() {
                
            }
            func forgotPasswordTapped() {
                
            }
        }
        class ResetPasswordPhoneFormViewModel: ResetPasswordPhoneFormViewModelProtocol {
            var phoneNumber: String = ""
            var countryEmoji: Character = "🇺🇦"
            
            func sendCodeTapped() {
                
            }
        }
        class ResetPasswordNewPasswordFormViewModel: ResetPasswordNewPasswordFormViewModelProtocol {
            var password: String = ""
            var confirmedPassword: String = ""
            
            func signInTapped() {
                
            }
        }
        class MFACodeFormViewModel: MFACodeFormViewModelProtocol {
            var mfaCode: String = ""
            var resendCodeTime: String = ""
            
            func resendTapped() {
                
            }
            func codeFilled() {
                
            }
        }
    }
}
