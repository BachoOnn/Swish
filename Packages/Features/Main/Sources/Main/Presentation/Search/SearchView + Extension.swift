//
//  SearchView + Extension.swift
//  Main
//
//  Created by Bacho on 19.01.26.
//

import SwiftUI
import Common

extension SearchView {
    var pickerSection: some View {
        VStack(spacing: 20) {
            Picker("", selection: $viewModel.selectedSide) {
                ForEach(SearchPickerSide.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            .padding(.vertical, 5)
            
            switch viewModel.selectedSide {
            case .Teams:
                if viewModel.isLoading {
                    VStack {
                        CustomProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1)
                        
                        Text("Loading Teams...")
                            .fontDesign(.monospaced)
                        
                        Spacer()
                    }
                } else if viewModel.teams.isEmpty && !viewModel.searchText.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        
                        Text("No Teams Found on \(viewModel.searchText)")
                            .font(.headline)
                        
                        Spacer()
                    }
                    .padding(.top, 40)
                } else if viewModel.teams.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "basketball")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        
                        Text("No Teams Available")
                            .font(.headline)
                        
                        if let error = viewModel.errorMessage {
                            Text(error)
                                .font(.subheadline)
                                .foregroundColor(.red)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        }
                        
                        Spacer()
                    }
                    .padding(.top, 40)
                } else {
                    ScrollView {
                        LazyVStack(spacing: 20) {
                            ForEach(viewModel.teams, id: \.self) { team in
                                TeamCellView(team: team)
                                    .frame(width: 380, height: 80)
                                    .onTapGesture {
                                        viewModel.navigateToTeam(team)
                                    }
                            }
                        }
                    }
                }
                
            case .Players:
                ScrollView {
                    LazyVStack(spacing: 20) {
                        ForEach(viewModel.players, id: \.self) { player in
                            PlayerCellView(player: player)
                                .frame(width: 380, height: 80)
                                .onTapGesture {
                                    viewModel.navigateToPlayer(player)
                                }
                        }
                    }
                }
            }
        }
    }
}
