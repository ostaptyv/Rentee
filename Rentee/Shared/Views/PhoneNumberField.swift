//
//  PhoneNumberField.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 17.04.2022.
//

import SwiftUI

struct PhoneNumberField: View {
    @Binding private var text: String
    @Binding private var country: String
    
    private var titleKey: LocalizedStringKey
    private var prompt: Text?
    
    var body: some View {
        HStack(spacing: 0) {
            TextField(titleKey, text: $text, prompt: prompt)
            
            Divider()
                .frame(height: 45)
            
            ZStack {
                RoundedCornersRectangle(radius: 15, corners: [.topTrailing, .bottomTrailing])
                    .foregroundColor(Color(hex: "F9F9FB"))
                Text(country)
                    .padding([.top, .bottom], 12.3)
                    .padding(.trailing, 11)
                    .padding(.leading, 8)
                    .layoutPriority(1)
            }
        }
    }
    
    init(_ titleKey: LocalizedStringKey = "TODO; CONTACT DEVELOPERS",
         text: Binding<String>,
         prompt: Text? = nil,
         country: Binding<Character>) {
        
        self.titleKey = titleKey
        self._text = text
        self.prompt = prompt
        
        self._country = Binding<String>(
            get: {
                return String(country.wrappedValue)
            },
            set: { flag in
                country.wrappedValue = Character(flag)
            }
        )
    }
}

struct PhoneNumberField_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberField(text: .constant("asasassaas"), country: .constant("🇺🇦"))
            .textFieldStyle(.rentee(corners: [.topLeading, .bottomLeading]))
    }
}
