//
//  SignInView.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 22.04.2022.
//

import SwiftUI

struct SignInView: ViewProtocol {
    @StateObject var viewModel = SignInViewModel()
    let router: SignInRouter
    
    @State var route: SignInRoute = .initial
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
        self.router = SignInRouter(pictogram: pictogram)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            SignInView(pictogram: .constant(.renteeLogo))
        }
    }
}
