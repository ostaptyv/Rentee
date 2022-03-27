//
//  RenteeTextFieldStyle.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 28.03.2022.
//

import SwiftUI

struct RenteeTextFieldStyle: TextFieldStyle {
//    @FocusState private var textFieldFocused: Bool
    
    // swiftlint:disable:next identifier_name
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding([.top, .bottom], 12)
            .padding([.leading, .trailing], 21)
            .foregroundColor(.black)
            .background(Color(hex: "F9F9FB"))
            .cornerRadius(15)
            .font(R.font.notoSansRegular.font(size: 14))
//            .focused($textFieldFocused)
//            .onTapGesture {
//                textFieldFocused = true
//            }
    }
}

extension TextFieldStyle where Self == RenteeTextFieldStyle {
    static var rentee: Self {
        return Self()
    }
}
