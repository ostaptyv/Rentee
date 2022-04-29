//
//  ViewProtocol.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import SwiftUI

protocol ViewProtocol: View {
    associatedtype ViewModel: ViewModelProtocol
    associatedtype Router: RouterProtocol where Router.Route == ViewModel.Route
    
    var viewModel: ViewModel { get }
    var router: Router { get }
}
