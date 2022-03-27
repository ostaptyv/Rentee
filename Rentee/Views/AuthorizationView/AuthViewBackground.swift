//
//  AuthViewBackground.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 28.03.2022.
//

import SwiftUI

struct AuthViewBackground<Content: View>: View {
    private let content: () -> Content
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(hex: "1F1F3B"))
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image(R.image.authorizationView.backgroundTown)
                    .resizable()
                    .scaledToFit()
            }
            .edgesIgnoringSafeArea(.bottom)
            
            ScrollView(.vertical, showsIndicators: false) {
                content()
            }
            .clipped()
        }
    }
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
}

struct AuthorizationViewBackground_Previews: PreviewProvider {
    static var previews: some View {
        AuthViewBackground {
            
        }
    }
}
