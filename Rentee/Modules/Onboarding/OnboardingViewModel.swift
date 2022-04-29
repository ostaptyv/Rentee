//
//  OnboardingViewModel.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import Foundation

class OnboardingViewModel: ViewModelProtocol {
    @Published var route: OnboardingRoute? = .initial
}
