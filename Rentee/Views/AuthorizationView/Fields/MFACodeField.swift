//
//  MFACodeField.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 19.04.2022.
//

import SwiftUI

struct MFACodeField: UIViewRepresentable {
    @Binding fileprivate var text: String
    
    private let digits = 4
    private var titleKey: LocalizedStringKey
    private var onCodeFilledClosure: (() -> Void)?
    
    // MARK: - UIViewRepresentable implementation
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIView(context: Context) -> RNTCodeMFAField {
        let mfaCodeField = try! RNTCodeMFAField(digitsCount: digits)
        mfaCodeField.delegate = context.coordinator
        
        return mfaCodeField
    }
    func updateUIView(_ uiView: RNTCodeMFAField, context: Context) {
        guard context.coordinator.shouldUpdateView else {
            // 2. When the execution enters this block, we know that it came from
            // updating some @Binding or @State in Coordinator. So now we need to
            // allow other process to proceed with updating UIView.
            context.coordinator.shouldUpdateView = true
            return
        }
        
        try! uiView.setCode(text)
    }
    
    // MARK: - Coordinator
    
    class Coordinator: RNTCodeMFAFieldDelegate {
        var parent: MFACodeField
        var shouldUpdateView = true
        
        func codeUpdated(_ code: String) {
            // 1. This Bool is needed to take control over change-update loop.
            //
            // When updating the binding from the coordinator, SwiftUI emits
            // warning: "Modifying state during view update, this will cause
            // undefined behavior". SwiftUI displays this error since it
            // knows that @Binding or @State change will trigger
            // 'updateUIView(_:context:)' method of our UIViewRepresentable,
            // which is unwanted since we've already updated internal state
            // of the UIViewRepresentable in Coordinator.
            //
            // In other words, it warns us to be careful when modifying
            // @Binding or @State from the inside to maintain data flow
            // isolation and consistency.
            // However, we still want to receive updates when someone outside
            // of the Coordinator updates its state, e.g. some @Binding from
            // the outside of the view, or @State by some other process inside
            // the view.
            shouldUpdateView = false
            
            parent.text = code
        }
        func codeFilled() {
            self.parent.onCodeFilledClosure?()
        }
        
        init(_ mfaCodeField: MFACodeField) {
            parent = mfaCodeField
        }
    }
    
    // MARK: - Modifiers
    
    func onCodeFilled(_ closure: @escaping () -> Void) -> MFACodeField {
        var view = self
        view.onCodeFilledClosure = closure
        
        return view
    }
    
    // MARK: - Initializers
    
    init(_ titleKey: LocalizedStringKey = "TODO; CONTACT DEVELOPERS",
         text: Binding<String>) {
        
        self.titleKey = titleKey
        self._text = text
    }
}

struct MFACodeField_Previews: PreviewProvider {
    static var previews: some View {
        MFACodeField(text: .constant("189"))
            .padding([.trailing, .leading], 56)
            .padding([.top, .bottom], 339)
    }
}
