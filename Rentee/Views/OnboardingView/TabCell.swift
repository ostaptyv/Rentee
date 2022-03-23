//
//  TabCell.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 23.03.2022.
//

import SwiftUI

struct TabCell: View {
    private(set) var entity: OnboardingEntity
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: entity.imageData)!)
                .resizable()
                .clipShape(UpDownWave(radius: 38))

            Spacer()
                .frame(maxHeight: 15)
            
            VStack(alignment: .leading, spacing: 15) {
                Text(entity.header)
                    .foregroundColor(Color(hex: "3545B1"))
                    .font(R.font.ptSerifBold.font(size: 28))
                    .fixedSize(horizontal: false, vertical: true)
                
                Rectangle()
                    .foregroundColor(Color(hex: "FAA460"))
                    .frame(maxWidth: 82, maxHeight: 3)
                
                Text(entity.description)
                    .font(R.font.notoSansRegular.font(size: 14))
                    .foregroundColor(Color(hex: "1F1F3B"))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(height: 145)
            .padding([.leading, .trailing], 48)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabCell_Previews: PreviewProvider {
    private static var onboardingEntities: [OnboardingEntity] {
        return Mock.onboardingEntities
    }
    
    static var previews: some View {
        VStack {
            TabCell(entity: onboardingEntities.first!)
                .ignoresSafeArea(edges: .top)
//                .layoutPriority(-1)
            
            Spacer()
//                .layoutPriority(0)
        }
        .ignoresSafeArea(edges: .top)
    }
}
