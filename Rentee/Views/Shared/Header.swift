//
//  Header.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 29.03.2022.
//

import SwiftUI

struct Header<Content: View>: View {
    private let content: () -> Content
    private let title: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
                .font(R.font.notoSansBold.font(size: 12))
                .foregroundColor(Color(hex: "383861"))
            
            content()
        }
    }

    init(_ title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }
}

struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header("title") {
            Group {}
        }
    }
}
