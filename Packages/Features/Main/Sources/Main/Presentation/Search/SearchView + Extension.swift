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
                teamsListSection
                
            case .Players:
                playersListSection
            }
        }
    }
        
    var teamsListSection: some View {
        ZStack {
            if viewModel.isLoadingTeams {
                CustomLoadingView(message: "Loading Teams...")
            } else if viewModel.teams.isEmpty && !viewModel.searchText.isEmpty {
                emptySearchView(searchText: viewModel.searchText, type: "Teams")
            } else if viewModel.teams.isEmpty {
                noDataView(message: "No Teams Available", error: viewModel.errorMessage)
            } else {
                teamsContent
            }
        }
    }
    
    var teamsContent: some View {
        
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
        
    var playersListSection: some View {
        Group {
            if viewModel.searchText.isEmpty {
                placeholderView(
                    icon: "magnifyingglass",
                    title: "Search for NBA Players",
                    message: "Enter a player's name to get started"
                )
            } else if viewModel.isLoadingPlayers {
                CustomLoadingView(message: "Searching Players...")
            } else if viewModel.players.isEmpty {
                emptySearchView(searchText: viewModel.searchText, type: "Players")
            } else {
                playersContent
            }
        }
    }
    
    var playersContent: some View {
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(viewModel.players, id: \.id) { player in
                        PlayerCellView(player: player)
                            .frame(width: 380, height: 80)
                            .onTapGesture {
                                viewModel.navigateToPlayer(player)
                            }
                    }
            }
        }
    }
    
    func emptySearchView(searchText: String, type: String) -> some View {
        VStack(spacing: 16) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 50))
                .foregroundColor(.gray)
            
            Text("No \(type) Found")
                .font(.headline)
            
            Text("No results for '\(searchText)'")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding(.top, 40)
    }
    
    func noDataView(message: String, error: String?) -> some View {
        VStack(spacing: 16) {
            Image(systemName: "basketball")
                .font(.system(size: 50))
                .foregroundColor(.gray)
            
            Text(message)
                .font(.headline)
            
            if let error = error {
                Text(error)
                    .font(.subheadline)
                    .foregroundColor(.red)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            Spacer()
        }
        .padding(.top, 40)
    }
    
    func placeholderView(icon: String, title: String, message: String) -> some View {
        VStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 60))
                .foregroundColor(.gray)
            
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
            
            Text(message)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Spacer()
        }
        .padding()
    }
}
