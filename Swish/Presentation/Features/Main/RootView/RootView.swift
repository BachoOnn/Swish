//
//  RootView.swift
//  Auth
//
//  Created by Bacho on 01.01.26.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var viewModel: RootViewModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $viewModel.selectedTab) {
                
                HomeView(viewModel: viewModel.homeViewModel)
                    .tag(Tabs.home)
                    .toolbarBackground(.hidden, for: .tabBar)
                
                GamesView()
                    .tag(Tabs.games)
                    .toolbarBackground(.hidden, for: .tabBar)
                
                SearchView()
                    .tag(Tabs.search)
                    .toolbarBackground(.hidden, for: .tabBar)
                
                DiscoverView()
                    .tag(Tabs.discover)
                    .toolbarBackground(.hidden, for: .tabBar)
            }
            
            CustomTabBar(selectedTab: $viewModel.selectedTab)
                .frame(height: 110)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    RootView(viewModel: RootViewModel(homeViewModel: HomeViewModel()))
}
