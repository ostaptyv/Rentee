//
//  OnboardingRouter.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import SwiftUI

enum OnboardingRoute: RouteType {
    case onboarding
    case signUp
    case signIn
    
    static let initial: OnboardingRoute = .onboarding
}

struct OnboardingRouter: RouterProtocol {
    @ViewBuilder func view(for route: OnboardingRoute) -> some View {
        AuthorizationView(flow: mapRouteToFlow(route)!)
    }
    
    private func mapRouteToFlow(_ route: OnboardingRoute) -> AuthorizationView.Flow? {
        switch route {
        case .signUp:
            return .signUp
        case .signIn:
            return .signIn
        case .onboarding:
            return nil
        }
    }
}
