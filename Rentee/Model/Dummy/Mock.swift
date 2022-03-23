//
//  Mock.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 12.02.2022.
//

import Foundation
import UIKit

struct Mock {
    static let onboardingEntities = [
        OnboardingEntity(id: UUID(),
                         imageData: Self.imageData(imageName: "PlaceholderImageHouse1"),
                         header: "Choose from a thousand of places",
                         description: "We provide you with a variant of accommodation for a better choice"),
        
        OnboardingEntity(id: UUID(),
                         imageData: Self.imageData(imageName: "PlaceholderImageHouse2"),
                         header: "Well-selected accommodation",
                         description:
                            "We provide you with a variant of accommodation for a better choice"),
        
        OnboardingEntity(id: UUID(),
                         imageData: Self.imageData(imageName: "PlaceholderImageHouse3"),
                         header: "Cool and secure service",
                         description: "We provide you with a variant of accommodation for a better choice")
    ]
    
    static private func imageData(imageName: String) -> Data {
        UIImage(named: imageName)!.pngData()!
    }
}
