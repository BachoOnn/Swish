//
//  SearchView.swift
//  Swish
//
//  Created by Bacho on 01.01.26.
//

import SwiftUI
import Common
import Helpers

struct SearchView: View {
    
    @StateObject var viewModel: SearchViewModel
    @FocusState var searchIsFocused: Bool
    @State private var hasLoadedTeams = false
    
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
        .onLoad(perform: viewModel.onLoad)
        .refreshable { viewModel.onRefresh() }
    }
}
