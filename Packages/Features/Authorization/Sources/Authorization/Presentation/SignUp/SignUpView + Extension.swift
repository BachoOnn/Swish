//
//  SignUpView + Extension.swift
//  Authorization
//
//  Created by Bacho on 22.01.26.
//

import SwiftUI
import Common

extension SignUpView {
    
    var headerSection: some View {
        VStack(spacing: 12) {
            Text("Join the Court")
                .font(.system(size: 32, weight: .bold))
            Text("Create your account to get started")
                .font(.system(size: 14))
                .foregroundColor(.secondary)
        }
        .padding()
        .padding(.top, 40)
    }
    
    var inputsSection: some View {
        
        VStack(spacing: 25) {
            GlassTextField(
                title: "First Name",
                icon: "person.fill",
                text: $viewModel.firstName
            )
            
            GlassTextField(
                title: "Last Name",
                icon: "person.fill",
                text: $viewModel.lastName
            )
            
            GlassEmailField(
                email: $viewModel.email,
                text: "Email"
            )
            
            GlassPasswordField(
                password: $viewModel.password,
                text: "Password"
            )
            
            GlassPasswordField(
                password: $viewModel.confirmPassword,
                text: "Confirm Password"
            )
            
            Button {
                Task {
                    await viewModel.signUp(
                        email: viewModel.email,
                        password: viewModel.password,
                        confirmPassword: viewModel.confirmPassword,
                        firstName: viewModel.firstName,
                        lastName: viewModel.lastName
                    )
                }
            } label: {
                HStack {
                    if viewModel.isLoading {
                        ProgressView()
                            .tint(Color(.systemBackground))
                    } else {
                        Text("Create Account")
                            .font(.system(size: 17, weight: .semibold))
                    }
                }
                .foregroundColor(Color(.systemBackground))
                .frame(maxWidth: .infinity)
                .frame(height: 30)
                .padding()
                .background(Color(.label))
                .roundedCorners(16)
            }
            .disabled(viewModel.isLoading)
        }
        .padding()
    }
    
    var belowSection: some View {
        VStack {
            HStack(spacing: 5) {
                Text("Already have an account?")
                    .font(.system(size: 14))
                    .tint(.primary)
                Button {
                    viewModel.goSingInPage()
                } label: {
                    Text("Sign In")
                        .font(.system(size: 14))
                        .bold()
                        .tint(.primary)
                }
            }
            
            Text("By signing up, you agree to our Terms & Privacy Policy")
                .font(.caption)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.top, 10)
        }
    }
}
