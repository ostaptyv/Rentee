//
//  SegmentedControl.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 07.07.2022.
//

import SwiftUI

extension String: Identifiable {
    public var id: Self {
        return self
    }
}

struct SegmentedControl<SelectionValue, Content>: View where SelectionValue: Hashable, Content: View {
    @Binding var selection: SelectionValue
    let content: () -> Content
    
    @State var array = ["All", "Stay", "Office"]
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color(hex: "F3F6FE")!)
//                .padding(-15)
                .layoutPriority(-1)
            
            HStack(alignment: .center, spacing: 0) {
                ForEach(array, id: \.self) { string in
                    if string is SelectionValue, selection == string {
                    Text(string)
                        .frame(width: 103, height: 44, alignment: .center)
                        .font(R.font.notoSansSemiBold.font(size: 14))
//                    if array.last! != string {
//                        Spacer()
//                    }
                    }
                }
                
            }
        }
//        .frame(width: 200)
        
    }
    
    public init(selection: Binding<SelectionValue>, @ViewBuilder content: @escaping () -> Content) {
        self._selection = selection
        self.content = content
    }
}

struct SegmentedControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControl(selection: .constant("sdada"), content: { EmptyView() })
    }
}
