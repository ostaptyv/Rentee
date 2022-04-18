//
//  Corner.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 17.04.2022.
//

import Foundation

@frozen enum Corner: UInt8, CaseIterable {
    case topLeading       = 0b00000001  // 1 << 0
    case topTrailing      = 0b00000010  // 1 << 1
    case bottomLeading    = 0b00000100  // 1 << 2
    case bottomTrailing   = 0b00001000  // 1 << 3
    
    struct Set: OptionSet {
        let rawValue: UInt8
        
        static let topLeading       = Set(rawValue: Corner.topLeading.rawValue)
        static let topTrailing      = Set(rawValue: Corner.topTrailing.rawValue)
        static let bottomLeading    = Set(rawValue: Corner.bottomLeading.rawValue)
        static let bottomTrailing   = Set(rawValue: Corner.bottomTrailing.rawValue)
        
        static let all: Set = [.topLeading, .topTrailing, .bottomLeading, .bottomTrailing]
    }
}
