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
        VStack {
            Picker("", selection: $viewModel.selectedSide) {
                ForEach(SearchPickerSide.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            switch viewModel.selectedSide {
            case .Teams:
                List {
                    ForEach(0..<20, id: \.self) { _ in
                        Text("Teams here")
                            .listRowBackground(Color.clear)
                            .onTapGesture {
                                viewModel.navigateToTeam(.lakersMock)
                            }
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .scrollIndicators(.hidden)
                
            case .Players:
                List {
                    ForEach(0..<20, id: \.self) { _ in
                        Text("Players here")
                            .listRowBackground(Color.clear)
                            .onTapGesture {
                                viewModel.navigateToPlayer(.lebronMock)
                            }
                    }
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden)
                .scrollIndicators(.hidden)
            }
        }
    }
}

#Preview {
    SearchView(viewModel: SearchViewModel(coordinator: MainCoordinator()))
}
