//
//  RenteeTextFieldStyle.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 28.03.2022.
//

import SwiftUI

struct RenteeTextFieldStyle: TextFieldStyle {
//    @FocusState private var textFieldFocused: Bool
    let corners: Corner.Set
    
    // swiftlint:disable:next identifier_name
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding([.top, .bottom], 12)
            .padding(verticalPadding(for: corners), 20)
            .foregroundColor(.black)
            .background(Color(hex: "F9F9FB"))
            .font(R.font.notoSansRegular.font(size: 14))
            .cornerRadius(15, corners: corners)
//            .focused($textFieldFocused)
//            .onTapGesture {
//                textFieldFocused = true
//            }
    }
    
    private func verticalPadding(for corners: Corner.Set) -> Edge.Set {
        var result = Edge.Set()
        
        if corners.contains(.topLeading) || corners.contains(.bottomLeading) {
            result.insert(.leading)
        }
        if corners.contains(.topTrailing) || corners.contains(.bottomTrailing) {
            result.insert(.trailing)
        }
        
        return result
    }
}

extension TextFieldStyle where Self == RenteeTextFieldStyle {
    static func rentee(corners: Corner.Set = .all) -> Self {
        return Self(corners: corners)
    }
}
