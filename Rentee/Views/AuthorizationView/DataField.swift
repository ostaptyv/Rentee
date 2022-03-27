//
//  DataField.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 28.03.2022.
//

import SwiftUI

extension DataField {
    enum `Type` {
        case generic
        case phoneNumber(country: Binding<String>)
        case secure
        case secureLookUp
        case mfaCode
        case icon(Image)
    }
}

struct DataField: View {
    @Binding var text: String
    
    private var title: String
    private var prompt: String
    private var errorMessage: String?
    private var isSecureEntry: Bool
    
    var body: some View {
        Header(title) {
            Group {
                if isSecureEntry {
                    LookUpSecureField("TODO; CONTACT DEVELOPERS", text: $text, prompt: Text(prompt))
                    
                } else {
                    TextField("TODO; CONTACT DEVELOPERS", text: $text, prompt: Text(prompt))
                }
            }
            .textFieldStyle(.rentee)
        }
    }
    
    init(text: Binding<String>,
         title: String = "Text field",
         prompt: String = "Prompt...",
         isSecureEntry: Bool = false) {
        
        self._text = text
        self.title = title
        self.prompt = prompt
        self.isSecureEntry = isSecureEntry
    }
}

extension DataField {
    func isSecureEntry(_ isSecureEntry: Bool) -> DataField {
        var copy = self
        copy.isSecureEntry = isSecureEntry
        
        return copy
    }
    func title(_ title: String) -> DataField {
        var copy = self
        copy.title = title
        
        return copy
    }
    func prompt(_ prompt: String) -> DataField {
        var copy = self
        copy.prompt = prompt
        
        return copy
    }
}

struct AuthField_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 50) {
            Group {
                DataField(text: .constant(""))
                    .errorMessage()
                    .frame(width: 264, height: 150)
                
                DataField(text: .constant("Some text"))
                    .errorMessage("Incorrect entry")
                    .frame(width: 264, height: 150)
            }
        }
    }
}
