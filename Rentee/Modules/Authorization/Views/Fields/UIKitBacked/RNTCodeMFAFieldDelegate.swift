//
//  RNTCodeMFAFieldDelegate.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 20.04.2022.
//

import UIKit

@objc protocol RNTCodeMFAFieldDelegate: AnyObject {
    @objc optional func codeUpdated(_ code: String)
    @objc optional func codeFilled()
}
