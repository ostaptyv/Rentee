//
//  RswiftSwiftUICompatibility.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 21.03.2022.
//

import SwiftUI
import Rswift

// Idea is taken from: https://medium.com/tbc-engineering/r-swift-swiftui-802acb5560ff

extension Image {
    init(_ imageResource: ImageResourceType) {
        self.init(imageResource.name)
    }
}
extension Color {
    init(_ colorResource: ColorResourceType) {
        self.init(colorResource.name)
    }
}
extension Font {
    init(fontResource: FontResourceType, size: CGFloat) {
        let uiFont = UIFont(resource: fontResource, size: size)!
        self = Font(uiFont as CTFont)
    }
}

extension ImageResource {
    var image: Image {
        Image(self)
    }
}
extension ColorResource {
    var color: Color {
        Color(self)
    }
}
extension FontResource {
    func font(size: CGFloat) -> Font {
        Font(fontResource: self, size: size)
    }
}
