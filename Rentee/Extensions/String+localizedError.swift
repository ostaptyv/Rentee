//
//  String+localizedError.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 20.04.2022.
//

import Foundation

extension String: LocalizedError {
    public var errorDescription: String? {
        return self
    }
}
