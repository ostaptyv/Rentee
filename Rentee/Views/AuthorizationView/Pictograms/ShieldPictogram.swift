//
//  ShieldPictogram.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 19.04.2022.
//

import SwiftUI

struct ShieldPictogram: View {
    let description: String
    
    var body: some View {
        VStack(spacing: 25) {
            Image(R.image.authorizationView.shieldIcon)
            Text(description)
                .font(R.font.notoSansSemiBold.font(size: 18))
                .foregroundColor(.white)
        }
    }
}

struct OperationPictogram_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
                .ignoresSafeArea()
            ShieldPictogram(description: "Verify")
        }
    }
}
