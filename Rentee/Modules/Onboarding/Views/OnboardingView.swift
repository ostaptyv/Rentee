//
//  OnboardingView.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 12.10.2021.
//

import SwiftUI

struct OnboardingView: ViewProtocol {
    @StateObject var viewModel = OnboardingViewModel()
    let router = OnboardingRouter()
    
    @State var route: OnboardingRoute = .initial
    @State var selection = 0
    
    private var onboardingEntities: [OnboardingCardEntity] {
        return Stubs.onboarding.cards
    }
    
    var body: some View {
        Group {
            if route == .onboarding {
                VStack(spacing: 0) {
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
                    .environmentObject(viewModel)
                    
                    Spacer(minLength: 46)
                }
                .edgesIgnoringSafeArea([.top, .bottom])
                .statusBarStyle(.dark)
            } else {
                router.view(for: route)
                    .transition(.move(edge: .trailing))
            }
        }
        .onReceive(viewModel.$route.compactMap { $0 }) { route in
            withAnimation {
                self.route = route
            }
        }
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
