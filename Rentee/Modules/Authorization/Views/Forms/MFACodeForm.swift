//
//  MFACodeForm.swift
//  Rentee
//
//  Created by Ostap Tyvonovych on 18.04.2022.
//

import SwiftUI

struct MFACodeForm<ViewModel>: View where ViewModel: MFACodeFormViewModelProtocol {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        OperationDescription("Please enter the verification code sent to your phone number") {
            Header("Your code here") {
                MFACodeField(text: $viewModel.mfaCode)
                    .onCodeFilled {
                        viewModel.codeFilled()
                    }
                    .textContentType(.oneTimeCode)
                    .frame(height: 55)
                    .errorMessage()
            }
            
            Spacer(minLength: 15)
            HStack {
                Text(viewModel.resendCodeTime)
                    .font(R.font.notoSansRegular.font(size: 12))
                    .foregroundColor(Color(hex: "7583A0")!)
                
                Spacer()
                
                Button("Resend") {
                    viewModel.resendTapped()
                }
                .buttonStyle(.textButton)
            }
        }
    }
}

struct MFACodeForm_Previews: PreviewProvider {
    typealias PreviewMFACodeForm = MFACodeForm<Stubs.Authorization.MFACodeFormViewModel>
    
    static var previews: some View {
        VStack(spacing: 0) {
            PreviewMFACodeForm()
        }
        .environmentObject(Stubs.authorization.mfaCodeFormViewModel)
    }
}
