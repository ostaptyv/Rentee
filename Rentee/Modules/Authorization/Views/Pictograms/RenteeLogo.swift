//
//  RenteeLogo.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 28.03.2022.
//

import SwiftUI

struct RenteeLogo: View {
    var body: some View {
        VStack(spacing: 13) {
            Image(R.image.authorizationView.renteeLogo)
            Text("Rentee")
                .kerning(1.6)
                .font(R.font.notoSansBold.font(size: 19))
                .foregroundColor(.white)
        }
    }
}

struct RenteeLogo_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
            RenteeLogo()
        }
    }
}
