//
//  ViewModelProtocol.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import Combine

protocol ViewModelProtocol: ObservableObject {
    associatedtype Route: RouteType
     
    var route: Route? { get set }
}
