//
//  OnboardingView.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 12.10.2021.
//

import SwiftUI

struct OnboardingView: View {
    @State var selection = 0
    
    private var onboardingEntities: [OnboardingEntity] {
        return Stub.onboardingEntities
    }
    
    var body: some View {
        VStack {
            TabView(selection: $selection.animation()) {
                ForEach(onboardingEntities.indices, id: \.self) { index in
                    TabCell(entity: onboardingEntities[index])
                }
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            Spacer(minLength: 33)
            CapsulePageControl(pagesCount: onboardingEntities.count,
                               selection: $selection.animation(),
                               dotColor: Color(hex: "E5F1FF")!,
                               selectedDotColor: Color(hex: "79A5D4")!)
            
            Spacer(minLength: 33)
            ConditionalButtonStack(selection: $selection,
                                   tabsCount: onboardingEntities.count)
                .animation(.default, value: selection)
            
            Spacer(minLength: 46)
        }
        .edgesIgnoringSafeArea([.top, .bottom])
        .statusBarStyle(.dark)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    private static var currentPreviewDevice: String {
//        "iPhone 12 Pro Max"
//        "iPhone 11 Pro Max"
//        "iPhone 12 Pro"
//        "iPhone 11"
//        "iPhone 11 Pro"
//        "iPhone 8 Plus"
        "iPhone 12 Mini"
//        "iPhone 8"
//        "iPhone SE (1st generation)"
    }
    
    static var previews: some View {
        OnboardingView()
            .previewDevice(PreviewDevice(rawValue: currentPreviewDevice))
            .previewDisplayName(currentPreviewDevice)
    }
}
