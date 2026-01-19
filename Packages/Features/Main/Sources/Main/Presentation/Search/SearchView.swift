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
    @FocusState var searchIsFocused: Bool
    @State private var hasLoadedOnce = false
    
    var body: some View {
        ZStack {
            GradientBackground()
                .onTapGesture {
                    searchIsFocused = false
                }
            
            VStack {
                SearchBarView(
                    searchText: $viewModel.searchText,
                    isKeyboardFocused: $searchIsFocused
                )
                pickerSection
                    .padding(.bottom, 15)
            }
        }
        .task(id: hasLoadedOnce) {
            guard !hasLoadedOnce else { return }
            await viewModel.loadTeams()
            hasLoadedOnce = true
        }
        .refreshable {
            Task {
                await viewModel.loadTeams()
            }
        }
    }
}

