//
//  SignInView.swift
//  Swish
//
//  Created by Bacho on 31.12.25.
//

import SwiftUI
import Common
import Helpers

struct SignInView: View {
    
    @StateObject var viewModel: SignInViewModel
    
    var body: some View {
        ZStack {
            GradientBackground()
            
            VStack(spacing: 16) {
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
            title: "Authentication Failed",
            message: viewModel.errorMessage
        )
    }
}
