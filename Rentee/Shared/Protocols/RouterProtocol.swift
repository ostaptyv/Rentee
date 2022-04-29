//
//  RouterProtocol.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import SwiftUI

protocol RouterProtocol {
  associatedtype Route: RouteType
  associatedtype Body: View
 
  @ViewBuilder func view(for route: Route) -> Body
}

protocol RouteType: Hashable & Identifiable & CaseIterable {}

extension RouteType {
    var id: Int {
        return self.hashValue
    }
}
