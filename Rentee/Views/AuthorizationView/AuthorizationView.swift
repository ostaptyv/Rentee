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
    @State var password = ""
    @State var confirmedPassword = ""
    
    let buttonSize = CGSize(width: 184, height: 50)
    
    var body: some View {
        AuthViewBackground {
            VStack {
                Spacer(minLength: 30)
                RenteeLogo()
                
                Spacer(minLength: 30)
                AuthFieldSheet {
                    SignUpForm(fullName: $fullName,
                               phoneNumber: $phoneNumber,
                               password: $password,
                               confirmedPassword: $confirmedPassword,
                               buttonSize: buttonSize)
                    
                    Spacer()
                        .frame(maxHeight: 15)
                    
                    SignInProposal()
                }
                
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
