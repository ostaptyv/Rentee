//
//  AuthFieldSheet.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 28.03.2022.
//

import SwiftUI

struct AuthFieldSheet<Content: View>: View {
    private let content: () -> Content
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(25)
            
            VStack {
                content()
            }
            .padding(24)
        }
        .padding([.leading, .trailing], 32)
        .clipped()
    }
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
}

struct AuthFieldSheet_Previews: PreviewProvider {
    static var previews: some View {
        AuthFieldSheet {
            
        }
    }
}
