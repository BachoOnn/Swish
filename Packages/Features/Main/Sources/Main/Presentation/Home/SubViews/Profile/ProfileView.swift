//
//  ProfileView.swift
//  Swish
//
//  Created by Bacho on 06.01.26.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            
            headerSection
            
            ScrollView {
                VStack(spacing: 50) {
                    imageSection
                    
                    subscriptionSection
                    
                    favoritesSection
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}


#Preview {
    ProfileView(viewModel: ProfileViewModel(coordinator: MainCoordinator()))
}

private extension ProfileView {
    
    private var headerSection: some View {
        ZStack {
            Color(.systemBackground)
            HStack {
                BackButton {
                    viewModel.navigateBack()
                }
                .padding(.horizontal)
                
                Spacer()
                
                Button {
                    viewModel.signOut()
                } label: {
                    Text("Sign Out")
                        .foregroundStyle(.red)
                        .bold()
                }
                
            }
        }
        .padding(.trailing)
        .frame(height: 50)
    }
    
    private var imageSection: some View {
        ZStack {
            Image("poster1")
                .resizable()
                .frame(height: 330)
                .overlay {
                    Color.black.opacity(0.5)
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Group {
                            Text("WELCOME TO SWISH")
                                .font(.system(size: 30, weight: .bold))
                            
                            
                            Text(viewModel.userEmail)
                                .font(.system(size: 20, weight: .semibold))
                            
                            Text("Get more from the league you love, with everything you need to stay connected and enjoy every moment.")
                                .font(.system(size: 16, weight: .light))

                        }
                        .tint(.white)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 10)
                    }
                }
        }
    }
    
    private var subscriptionSection: some View {
        VStack(spacing: 30) {
            
            HStack {
                Image("ball")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text("SWISH Pass")
                    .font(.system(size: 30, weight: .semibold))
            }
            
            VStack (alignment: .leading, spacing: 16) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    
                    Text("Get unlimited access")
                    
                    Spacer()
                }
                HStack {
                    Image(systemName: "checkmark.circle")
                    
                    Text("Become one of the Swisher!")
                }
            }
            .padding(.horizontal)
            
            
            Button {
                viewModel.subscribe()
            } label: {
                Text("Subscribe")
                    .font(.system(size: 16, weight: .semibold))
                    .tint(Color(.systemBackground))
                    .frame(width: 300, height: 30)
                    .padding()
                    .background(Color(.label))
                    .roundedCorners(15)
            }
            
        }
    }
    
    private var favoritesSection: some View {
        
        VStack(alignment: .leading, spacing: 80) {
            
            HStack {
                Text("MY TEAMS")
                
                Spacer()
            }
            
            HStack {
                Text("MY PLAYERS")
                
                Spacer()
            }
            
        }
        .padding(.horizontal)
    }
}
