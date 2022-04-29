//
//  OperationDescription.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 21.04.2022.
//

import SwiftUI

struct OperationDescription<Content: View>: View {
    private let content: () -> Content
    private let text: String
    
    var body: some View {
        VStack {
            Spacer(minLength: 8)
            Text(text)
                .font(R.font.notoSansRegular.font(size: 14))
                .foregroundColor(Color(hex: "7583A0")!)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 24)
            
            content()
        }
    }
    
    init(_ text: String, @ViewBuilder content: @escaping () -> Content) {
        self.text = text
        self.content = content
    }
}

struct OperationDescription_Previews: PreviewProvider {
    static var previews: some View {
        OperationDescription("title") {
            Group {}
        }
    }
}
