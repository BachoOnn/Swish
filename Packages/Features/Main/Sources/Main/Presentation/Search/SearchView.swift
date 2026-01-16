//
//  SearchView.swift
//  Swish
//
//  Created by Bacho on 01.01.26.
//

import SwiftUI
import Common

struct SearchView: View {
    
    @StateObject var viewModel: SearchViewModel
    @State var searchText: String = ""
    @FocusState var searchIsFocused: Bool
    
    var body: some View {
        ZStack {
            GradientBackground()
                .onTapGesture {
                    searchIsFocused = false
                }
            
            VStack {
                SearchBarView(
                    searchText: $searchText,
                    isKeyboardFocused: $searchIsFocused
                )
                pickerSection
                
            }
        }
    }
}

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

#Preview {
    SearchView(viewModel: SearchViewModel(coordinator: MainCoordinator()))
}
