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
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @StateObject var viewModel: SignUpViewModel
    
    var body: some View {
        ZStack {
            
            GradientBackground()
    
                VStack(spacing: 10) {
                    
                    VStack(spacing: 12) {
                        Text("Join the Court")
                            .font(.system(size: 32, weight: .bold))
                        Text("Create your account to get started")
                            .font(.system(size: 14))
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .padding(.top, 40)
                    
                    VStack(spacing: 25) {
                        GlassTextField(title: "First Name", icon: "person.fill", text: $firstName)
                        
                        GlassTextField(title: "Last Name", icon: "person.fill", text: $lastName)
                        
                        GlassEmailField(email: $email, text: "Email")
                        
                        GlassPasswordField(password: $password, text: "Password")
                        
                        GlassPasswordField(password: $confirmPassword, text: "Confirm Password")
                        
                        Button {
                            Task {
                                await viewModel.signUp(
                                    email: email,
                                    password: password,
                                    confirmPassword: confirmPassword,
                                    firstName: firstName,
                                    lastName: lastName
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
