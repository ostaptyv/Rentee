//
//  ErrorMessageModifier.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 29.03.2022.
//

import SwiftUI

struct ErrorMessageModifier: ViewModifier {
    private let message: String?
    
    func body(content: Content) -> some View {
        VStack(alignment: .leading) {
            content
            
            if let messageUnwrapped = message {
                Spacer()
                    .frame(height: 10)
                
                Text(messageUnwrapped)
                    .font(R.font.notoSansBold.font(size: 10))
                    .foregroundColor(.red.opacity(0.75))
            }
        }
    }
    
    init(message: String? = nil) {
        self.message = message
    }
}

extension View {
    // TODO: TODO: Remove the string with nil; for debug purposes
    func errorMessage(_ message: String? = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam ultrices nec erat ut dictum. Mauris non urna ac leo eleifend commodo ac eu neque."
    ) -> some View {
        modifier(ErrorMessageModifier(message: message))
    }
}
