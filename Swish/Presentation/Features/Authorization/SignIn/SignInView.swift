//
//  SignInView.swift
//  Auth
//
//  Created by Bacho on 31.12.25.
//

import SwiftUI

struct SignInView: View {
    
    @State private var email = ""
    @State private var password = ""
    @StateObject var viewModel: SignInViewModel
    
    var body: some View {
        ZStack {
            GradientBackground()
            
            VStack(spacing: 16) {
                VStack(spacing: 12) {
                    Text("It's Game Time")
                        .font(.system(size: 32, weight: .bold))
                    Text("Sign in to access your stats")
                        .font(.system(size: 14))
                        .foregroundColor(.secondary)
                }
                .padding()
                
                VStack(spacing: 30) {
                    GlassEmailField(email: $email, text: "Email")
                    GlassPasswordField(password: $password, text: "Password")
                    
                    Button {
                        Task {
                            await viewModel.signIn(email: email, password: password)
                        }
                    } label: {
                        HStack {
                            if viewModel.isLoading {
                                ProgressView()
                                    .tint(Color(.systemBackground))
                            } else {
                                Text("Sign In")
                                    .font(.system(size: 17, weight: .semibold))
                            }
                        }
                        .foregroundColor(Color(.systemBackground))
                        .frame(maxWidth: .infinity)
                        .frame(height: 30)
                        .padding()
                        .background(Color(.label))
                        .roundedCorners(16)
                        .overlay(alignment: .center) {
                            if !viewModel.isLoading {
                                Image(systemName: "basketball")
                                    .padding(.leading, 100)
                                    .tint(Color(.systemBackground))
                                    .font(.system(size: 20))
                            }
                        }
                        .padding(.top, 20)
                    }
                    .disabled(viewModel.isLoading)
                }
                .padding()
                
                HStack(spacing: 5) {
                    Text("Don't have an account?")
                        .font(.system(size: 14))
                        .tint(.primary)
                    Button {
                        viewModel.goSignUpPage()
                    } label: {
                        Text("Sign Up")
                            .font(.system(size: 14))
                            .bold()
                            .tint(.primary)
                    }
                }
                
                HStack(spacing: 16) {
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 150, height: 1)
                    
                    Text("OR")
                        .font(.caption)
                    
                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(width: 150, height: 1)
                }
                .padding(.top, 50)
                
                Button {
                    Task {
                        await viewModel.signInWithGoogle()
                    }
                } label: {
                    HStack {
                        Text("Continue with Google")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundColor(Color(.systemBackground))
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            .padding()
                            .background(Color(.label))
                            .roundedCorners(16)
                            .overlay {
                                Image("google")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding(.leading, 220)
                            }
                    }
                    .padding(.horizontal)
                    .padding(.top)
                }
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
