//
//  CapsulePageControl.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 21.03.2022.
//

import SwiftUI

struct CapsulePageControl: View {
    let pagesCount: Int
    @Binding var selection: Int
    
    let circleMargin: Double
    let circleDiameter: Double
    let selectedDotWidth: Double
    let dotColor: Color
    let selectedDotColor: Color
    
    var body: some View {
        HStack(spacing: circleMargin) {
            ForEach(0..<pagesCount, id: \.self) { index in
                Capsule()
                    .frame(width: capsuleWidth(for: index),
                           height: circleDiameter)
                    .foregroundColor(capsuleForegroundColor(for: index))
                    .animation(.default, value: selection)
            }
        }
    }
    
    private func capsuleWidth(for index: Int) -> Double {
        let isSelected = index == selection
        return isSelected ? selectedDotWidth : circleDiameter
    }
    private func capsuleForegroundColor(for index: Int) -> Color {
        let isSelected = index == selection
        return isSelected ? selectedDotColor : dotColor
    }
    
    init(pagesCount: Int,
         selection: Binding<Int>,
         circleMargin: Double = 20.0,
         circleDiameter: Double = 8.0,
         selectedDotWidth: Double = 25.0,
         dotColor: Color = .black,
         selectedDotColor: Color = .black) {
        
        self.pagesCount = pagesCount
        self._selection = selection
        self.circleMargin = circleMargin
        self.circleDiameter = circleDiameter
        self.selectedDotWidth = selectedDotWidth
        self.dotColor = dotColor
        self.selectedDotColor = selectedDotColor
    }
}

