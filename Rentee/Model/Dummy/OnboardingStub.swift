//
//  OnboardingStub.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import UIKit

extension Stubs {
    struct onboarding {
        static let cards = [
            OnboardingCardEntity(id: UUID(),
                             imageData: R.image.onboardingView.house1()!.pngData()!,
                             header: "Choose from a thousand of places",
                             description: "We provide you with a variant of accommodation for a better choice"),
            
            OnboardingCardEntity(id: UUID(),
                             imageData: R.image.onboardingView.house2()!.pngData()!,
                             header: "Well-selected accommodation",
                             description:
                                "We provide you with a variant of accommodation for a better choice"),
            
            OnboardingCardEntity(id: UUID(),
                             imageData: R.image.onboardingView.house3()!.pngData()!,
                             header: "Cool and secure service",
                             description: "We provide you with a variant of accommodation for a better choice")
        ]
    }
}
