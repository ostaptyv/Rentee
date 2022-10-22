//
//  HomeView.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 06.07.2022.
//

import SwiftUI

enum RoomType: String, CaseIterable, Identifiable {
    case all
    case stay
    case office
    
    var id: Self {
        return self
    }
}

struct HomeView: View {
    @State var selectedRoomType = "stay"
    
    var body: some View {
        Picker("Room Type", selection: $selectedRoomType) {
            ForEach(["all", "office", "stay"]) { roomType in
                Text(roomType.capitalized)
                
            }
        }
        .pickerStyle(.inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
