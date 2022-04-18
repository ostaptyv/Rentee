//
//  DataField.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 28.03.2022.
//

import SwiftUI

extension DataField {
    enum Kind {
        case generic
        case phoneNumber(country: Binding<Character>)
        case secure
        case secureLookUp
    }
}

struct DataField: View {
    @Binding var text: String
    
    private var title: String = "Text field"
    private var prompt: String = "Prompt..."
    private var errorMessage: String?
    private var kind: Kind
    
    var body: some View {
        Header(title) {
            Group {
                switch kind {
                case .generic:
                    TextField("TODO; CONTACT DEVELOPERS",
                              text: $text,
                              prompt: Text(prompt))
                case .phoneNumber(let country):
                    PhoneNumberField("TODO; CONTACT DEVELOPERS",
                                     text: $text,
                                     prompt: Text(prompt),
                                     country: country)
                case .secure:
                    SecureField("TODO; CONTACT DEVELOPERS",
                                text: $text,
                                prompt: Text(prompt))
                case .secureLookUp:
                    SecureLookUpField("TODO; CONTACT DEVELOPERS",
                                      text: $text,
                                      prompt: Text(prompt))
                }
            }
            .textFieldStyle(.rentee(corners: cornersToRound(for: kind)))
        }
    }
    
    private func cornersToRound(for kind: Kind) -> Corner.Set {
        switch kind {
        case .phoneNumber, .secureLookUp:
            return [.topLeading, .bottomLeading]
        default:
            return .all
        }
    }
    
    init(text: Binding<String>,
         kind: Kind = .generic) {
        
        self._text = text
        self.kind = kind
    }
}

extension DataField {
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

struct DataField_Previews: PreviewProvider {
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
