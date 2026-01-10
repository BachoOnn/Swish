//
//  RootView.swift
//  Swish
//
//  Created by Bacho on 01.01.26.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var viewModel: RootViewModel
    @ObservedObject var coordinator: MainCoordinator
    
    init(viewModel: RootViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
        _coordinator = ObservedObject(wrappedValue: viewModel.coordinator)
    }
    
    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
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
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .profile:
                    ProfileView(viewModel: viewModel.makeProfileViewModel())
                case .gameDetails(let game):
                    GameDetailsViewControllerWrapper(game: game)
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true)
                        .ignoresSafeArea()
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    let container = MainDIContainer()
    return RootView(viewModel: container.makeRootViewModel())
}
