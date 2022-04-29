//
//  AuthFormSheet.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 28.03.2022.
//

import SwiftUI

struct AuthFormSheet<Content: View>: View {
    private let content: () -> Content
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(25)
            
            VStack(spacing: 0) {
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
        AuthFormSheet {
            
        }
    }
}
