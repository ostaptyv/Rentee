//
//  Pictogram.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 21.04.2022.
//

import SwiftUI

enum PictogramType {
    case renteeLogo
    case verify
}

struct Pictogram: View {
    @Binding var type: PictogramType
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(height: 135)
            
            switch type {
            case .renteeLogo:
                RenteeLogo()
            case .verify:
                ShieldPictogram(description: "Verify")
            }
        }
    }
}
struct Pictogram_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Pictogram(type: .constant(.renteeLogo))
            Pictogram(type: .constant(.verify))
        }
        .background(Color.black)
    }
}
