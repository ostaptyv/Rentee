//
//  OnboardingEntity.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 12.02.2022.
//

import Foundation

struct OnboardingEntity: Identifiable {
    let id: UUID
    
    let imageData: Data
    let header: String
    let description: String
}
