//
//  AuthorizationView.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 27.03.2022.
//

import SwiftUI

extension AuthorizationView {
    enum Flow {
        case signUp
        case signIn
    }
}

struct AuthorizationView: View {
    @State var pictogram: PictogramType = .renteeLogo
    
    let flow: Flow
    let buttonSize = CGSize(width: 184, height: 50)
    
    var body: some View {
        AuthViewBackground {
            VStack(spacing: 0) {
                Pictogram(type: $pictogram)
                
                AuthFormSheet {
                    switch flow {
                    case .signUp:
                        SignUpView(pictogram: $pictogram)
                    case .signIn:
                        SignInView(pictogram: $pictogram)
                    }
                }
                .environment(\.mainActionButtonSize, buttonSize)
                
                Spacer(minLength: 61)
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
    
    init(flow: Flow) {
        self.flow = flow
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
        AuthorizationView(flow: .signUp)
            .previewDevice(PreviewDevice(rawValue: currentPreviewDevice))
            .previewDisplayName(currentPreviewDevice)
        
        AuthorizationView(flow: .signIn)
            .previewDevice(PreviewDevice(rawValue: currentPreviewDevice))
            .previewDisplayName(currentPreviewDevice)
    }
}
