//
//  AuthorizationView.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 27.03.2022.
//

import SwiftUI

struct AuthorizationView: View {
    @State var fullName = ""
    @State var phoneNumber = ""
    @State var countryEmoji: Character = "🇺🇦"
    @State var password = ""
    @State var confirmedPassword = ""
    
    @State var mfaCode = "1234"
    
    @State var isVerification = false
    @State var currentPictogram: PictogramType = .renteeLogo
    
    let buttonSize = CGSize(width: 184, height: 50)
    
    var body: some View {
        AuthViewBackground {
            VStack(spacing: 0) {
                Pictogram(type: $currentPictogram)
                
                AuthFieldSheet {
                    if !isVerification {
                        SignUpForm(fullName: $fullName,
                                   phoneNumber: $phoneNumber,
                                   countryEmoji: $countryEmoji,
                                   password: $password,
                                   confirmedPassword: $confirmedPassword)
                        .onSignUp {
                            withAnimation {
                                isVerification = true
                                currentPictogram = .verify
                            }
                        }
                    } else {
                        MFACodeForm(mfaCode: $mfaCode,
                                    resendCodeTime: "Resend in 12s")
                        .onResend {
                            withAnimation {
                                isVerification = false
                                currentPictogram = .renteeLogo
                            }
                        }
                    }
                }
                .buttonStyle(.mainAction(size: buttonSize))
                
                Spacer(minLength: 61)
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct AuthorizationView_Previews: PreviewProvider {
    private static var currentPreviewDevice: String {
//        "iPhone 12 Pro Max"
//        "iPhone 11 Pro Max"
//        "iPhone 12 Pro"
//        "iPhone 11"
//        "iPhone 11 Pro"
//        "iPhone 8 Plus"
//        "iPhone 12 Mini"
        "iPhone 8"
//        "iPhone SE (1st generation)"
    }
    
    static var previews: some View {
        AuthorizationView()
            .previewDevice(PreviewDevice(rawValue: currentPreviewDevice))
            .previewDisplayName(currentPreviewDevice)
    }
}
