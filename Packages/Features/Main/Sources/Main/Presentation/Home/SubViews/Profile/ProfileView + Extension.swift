//
//  ProfileView + Extension.swift
//  Main
//
//  Created by Bacho on 14.01.26.
//

import SwiftUI
import Common

extension ProfileView {
    
    var headerSection: some View {
        ZStack {
            Color(.clear)
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
    
    var imageSection: some View {
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
                            
                            Text(String(describing: viewModel.userName))
                                .font(.system(size: 25, weight: .semibold))
                            Text(String(describing: viewModel.userEmail))
                                .font(.system(size: 20, weight: .regular))
                            
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
    
    var subscriptionSection: some View {
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
    
    var favoritesSection: some View {
        
        VStack(alignment: .leading, spacing: 40) {
            
            VStack(alignment: .leading) {
                HStack {
                    Text("MY TEAMS")
                        .font(.title2)
                    
                    Spacer()
                    
                    Button {
                        viewModel.clearTeams()
                    } label: {
                        Text("Clear All")
                            .foregroundStyle(.red)
                            .font(.body)
                    }
                }
                VStack {
                    ScrollView(.horizontal) {
                        LazyHStack(spacing: 10) {
                            ForEach(viewModel.favoriteTeams, id: \.id) { team in
                                FavoriteTeamCardView(team: team)
                                    .onTapGesture {
                                        viewModel.goTeamDetails(team: team)
                                    }
                            }
                        }
                    }
                    .contentMargins(5, for: .scrollContent)
                }
            }
            
            VStack(alignment: .leading) {
                
                HStack {
                    Text("MY PLAYERS")
                        .font(.title2)
                    
                    Spacer()
                    
                    Button {
                        viewModel.clearPlayers()
                    } label: {
                        Text("Clear All")
                            .foregroundStyle(.red)
                            .font(.body)
                    }
                    
                }
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 10) {
                        ForEach(viewModel.favoritePlayers, id: \.id) { player in
                            FavoritePlayerCardView(player: player)
                                .onTapGesture {
                                    viewModel.goPlayerDetails(player: player)
                                }
                        }
                    }
                }
                .contentMargins(5, for: .scrollContent)
            }
        }
        .padding(.horizontal)
    }
}
