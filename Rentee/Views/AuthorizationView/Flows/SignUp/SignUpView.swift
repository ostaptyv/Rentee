//
//  SignUpView.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import SwiftUI

struct SignUpView: ViewProtocol {
    @StateObject var viewModel = SignUpViewModel()
    let router: SignUpRouter
    
    @State var route: SignUpRoute = .initial
    @Binding var pictogram: PictogramType
    
    var body: some View {
        router.view(for: route)
            .environmentObject(viewModel)
            .onReceive(viewModel.$route.compactMap { $0 }) { route in
                withAnimation {
                    self.route = route
                }
            }
            .onReceive(viewModel.$pictogram) { pictogram in
                withAnimation {
                    self.pictogram = pictogram
                }
            }
    }
    
    init(pictogram: Binding<PictogramType>) {
        self._pictogram = pictogram
        self.router = SignUpRouter(pictogram: pictogram)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            SignUpView(pictogram: .constant(.renteeLogo))
        }
    }
}
