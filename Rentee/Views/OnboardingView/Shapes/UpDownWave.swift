//
//  UpDownWave.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 21.03.2022.
//

import SwiftUI

struct UpDownWave: Shape {
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY - 2 * radius))
        path.addArc(center: CGPoint(x: rect.minX + radius,
                                    y: rect.maxY - 2 * radius),
                    radius: radius,
                    startAngle: .degrees(180),
                    endAngle: .degrees(90),
                    clockwise: true)
        path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius))
        path.addArc(center: CGPoint(x: rect.maxX - radius,
                                    y: rect.maxY),
                    radius: radius,
                    startAngle: .degrees(270),
                    endAngle: .degrees(0),
                    clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - 2 * radius))
        
        return path
    }
}
