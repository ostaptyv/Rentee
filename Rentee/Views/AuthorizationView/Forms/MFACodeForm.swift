//
//  MFACodeForm.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 18.04.2022.
//

import SwiftUI

struct MFACodeForm: View {
    @Binding var mfaCode: String
    var resendCodeTime: String

    private var onCodeFilledClosure: (() -> Void)?
    private var onResendClosure: (() -> Void)?
    
    var body: some View {
        Spacer(minLength: 8)
        Text("Please enter the verification code sent to your phone number")
            .font(R.font.notoSansRegular.font(size: 14))
            .foregroundColor(Color(hex: "7583A0")!)
            .multilineTextAlignment(.center)
        
        Spacer(minLength: 24)
        Header("Your code here") {
            MFACodeField(text: $mfaCode)
                .onCodeFilled {
                    onCodeFilledClosure?()
                }
                .textContentType(.oneTimeCode)
                .frame(height: 55)
                .errorMessage()
        }
        
        Spacer(minLength: 15)
        HStack {
            Text(resendCodeTime)
                .font(R.font.notoSansRegular.font(size: 12))
                .foregroundColor(Color(hex: "7583A0")!)
            
            Spacer()
            
            Button("Resend") {
                onResendClosure?()
            }
            .buttonStyle(.textButton)
        }
    }
    
    // MARK: - Modifiers
    
    func onCodeFilled(_ closure: @escaping () -> Void) -> MFACodeForm {
        var view = self
        view.onCodeFilledClosure = closure
        
        return view
    }
    func onResend(_ closure: @escaping () -> Void) -> MFACodeForm { 
        var view = self
        view.onResendClosure = closure
        
        return view
    }
    
    // MARK: - Initializers
    
    init(mfaCode: Binding<String>,
         resendCodeTime: String) {
        
        self._mfaCode = mfaCode
        self.resendCodeTime = resendCodeTime
    }
}

struct MFACodeForm_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            MFACodeForm(mfaCode: .constant(""),
                        resendCodeTime: "Resend in 12s")
        }
    }
}
