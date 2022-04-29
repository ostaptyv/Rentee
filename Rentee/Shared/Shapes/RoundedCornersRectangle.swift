//
//  RoundedCornersRectangle.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 17.04.2022.
//

import SwiftUI

struct RoundedCornersRectangle: Shape {
    var radius: CGFloat = .infinity
    var corners: Corner.Set = .all

    func path(in rect: CGRect) -> Path {
        let size = CGSize(width: radius, height: radius)
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: transformToUIKitRepresentation(corners: corners),
                                cornerRadii: size)
        
        return Path(path.cgPath)
    }
    
    private func transformToUIKitRepresentation(corners cornersOptionSet: Corner.Set) -> UIRectCorner {
        // Map Corner option set to Corner normal set (which can be operated on as on Sequence later):
        var cornersSet = Set<Corner>()
        for corner in Corner.allCases {
            let bitwiseConjuction = cornersOptionSet.rawValue & corner.rawValue
            let isCornerPresentInOptionSet = bitwiseConjuction != 0
            
            if isCornerPresentInOptionSet {
                cornersSet.insert(corner)
            }
        }
        
        // Map Corner normal set to UIRectCorner array
        let rectCorners = cornersSet.map(mapToUIKitRepresentation(corner:))
        
        // Map UIRectCorner array to UIRectCorner single value (by merging all the members of the array together into a single raw value using bitwise OR operator):
        var rectCornersOptionSet = UIRectCorner(rawValue: 0)
        for rectCorner in rectCorners {
            let rectCornersOptionSetRawValue = rectCornersOptionSet.rawValue | rectCorner.rawValue
            rectCornersOptionSet = UIRectCorner(rawValue: rectCornersOptionSetRawValue)
        }
        
        return rectCornersOptionSet
    }
    
    private func mapToUIKitRepresentation(corner: Corner) -> UIRectCorner {
        let writingDirection = UIApplication.shared.userInterfaceLayoutDirection
        
        switch writingDirection {
        case .leftToRight:
            switch corner {
            case .topLeading:
                return .topLeft
            case .topTrailing:
                return .topRight
            case .bottomLeading:
                return .bottomLeft
            case .bottomTrailing:
                return .bottomRight
            }
        case .rightToLeft:
            switch corner {
            case .topLeading:
                return .topRight
            case .topTrailing:
                return .topLeft
            case .bottomLeading:
                return .bottomRight
            case .bottomTrailing:
                return .bottomLeft
            }
        @unknown default:
            fatalError("New writing direction is found which is unexpected. Access the Apple Developer documentation of UIUserInterfaceLayoutDirection to get more details.")
        }
    }
}
