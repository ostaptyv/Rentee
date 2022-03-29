//
//  Stub.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 12.02.2022.
//

import UIKit

struct Stub {
    static let onboardingEntities = [
        OnboardingEntity(id: UUID(),
                         imageData: Self.data(imageName: "OnboardingView/House1"),
                         header: "Choose from a thousand of places",
                         description: "We provide you with a variant of accommodation for a better choice"),
        
        OnboardingEntity(id: UUID(),
                         imageData: Self.data(imageName: "OnboardingView/House2"),
                         header: "Well-selected accommodation",
                         description:
                            "We provide you with a variant of accommodation for a better choice"),
        
        OnboardingEntity(id: UUID(),
                         imageData: Self.data(imageName: "OnboardingView/House3"),
                         header: "Cool and secure service",
                         description: "We provide you with a variant of accommodation for a better choice")
    ]
    
    static private func data(imageName: String) -> Data {
        UIImage(named: imageName)!.pngData()!
    }
}
