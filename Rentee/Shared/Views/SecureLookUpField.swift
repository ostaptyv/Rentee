//
//  LookUpSecureField.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 28.03.2022.
//

import SwiftUI
import Rswift

struct SecureLookUpField: View {
    @Binding var text: String
    
    @State private var isPasswordLookUp: Bool = false
    private var titleKey: LocalizedStringKey
    private var prompt: Text?
    
    private var passwordLookUpImageResource: ImageResource {
        return isPasswordLookUp ? R.image.authorizationView.eyeIconCrossed : R.image.authorizationView.eyeIcon
    }
    
    var body: some View {
        HStack(spacing: 0) {
            Group {
                if isPasswordLookUp {
                    TextField(titleKey, text: $text, prompt: prompt)
                } else {
                    SecureField(titleKey, text: $text, prompt: prompt)
                }
            }
            .frame(height: 45)
            
            ZStack {
                RoundedCornersRectangle(radius: 15, corners: [.topTrailing, .bottomTrailing])
                    .foregroundColor(Color(hex: "F9F9FB"))
                Image(passwordLookUpImageResource)
                    .padding([.top, .bottom], 14.5)
                    .padding(.trailing, 18)
                    .padding(.leading, 12)
                    .layoutPriority(1)
                    .onTapGesture {
                        if !text.isEmpty {
                            isPasswordLookUp.toggle()
                        }
                    }
            }
        }
    }
    
    init(_ titleKey: LocalizedStringKey = "TODO; CONTACT DEVELOPERS",
         text: Binding<String>,
         prompt: Text? = nil) {
        
        self.titleKey = titleKey
        self._text = text
        self.prompt = prompt
    }
    
}

struct LookUpSecureField_Previews: PreviewProvider {
    static var previews: some View {
        SecureLookUpField(text: .constant("sddfds"), prompt: Text("Text"))
            .textFieldStyle(.rentee(corners: [.topLeading, .bottomLeading]))
    }
}
