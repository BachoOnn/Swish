//
//  SignUpView.swift
//  Swish
//
//  Created by Bacho on 31.12.25.
//

import SwiftUI
import Common
import Helpers

struct SignUpView: View {
    
    @StateObject var viewModel: SignUpViewModel
    
    var body: some View {
        ZStack {
            
            GradientBackground()
            
            VStack(spacing: 10) {
                headerSection
                
                inputsSection
                
                belowSection
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        
        .sheetAlert(
            isPresented: $viewModel.showError,
            title: "Sign Up Failed",
            message: viewModel.errorMessage
        )
    }
}
