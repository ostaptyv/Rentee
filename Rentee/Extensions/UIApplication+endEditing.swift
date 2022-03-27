//
//  UIApplication+endEditing.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 28.03.2022.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
