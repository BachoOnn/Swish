//
//  RootView.swift
//  Swish
//
//  Created by Bacho on 01.01.26.
//

import SwiftUI

public struct RootView: View {
    
    @StateObject var viewModel: RootViewModel
    @ObservedObject var coordinator: MainCoordinator
    
    let container: MainDIContainer
    
    public init(container: MainDIContainer) {
        self.container = container
        _coordinator = ObservedObject(wrappedValue: container.coordinator)
        _viewModel = StateObject(wrappedValue: container.makeRootViewModel())
    }
    
    public var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            ZStack(alignment: .bottom) {
                TabView(selection: $viewModel.selectedTab) {
                
                    homeTab
                    gamesTab
                    searchTab
                    discoverTab
                }
                
                CustomTabBar(selectedTab: $viewModel.selectedTab)
                    .frame(height: 110)
            }
            .navigationDestination(for: AppRoute.self) { route in
                switch route {
                case .profile:
                    ProfileView(viewModel: container.makeProfileViewModel())
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
    
    // MARK: - Tab Views
    
    @ViewBuilder
    private var homeTab: some View {
        HomeView(viewModel: container.makeHomeViewModel())
            .tag(Tabs.home)
            .toolbarBackground(.hidden, for: .tabBar)
    }
    
    @ViewBuilder
    private var gamesTab: some View {
        GamesView(viewModel: container.makeGamesViewModel())
            .tag(Tabs.games)
            .toolbarBackground(.hidden, for: .tabBar)
    }
    
    @ViewBuilder
    private var searchTab: some View {
        NavigationStack { 
            SearchView(viewModel: container.makeSearchViewModel())
        }
        .tag(Tabs.search)
        .toolbarBackground(.hidden, for: .tabBar)
    }
    
    @ViewBuilder
    private var discoverTab: some View {
        DiscoverView(viewModel: container.makeDiscoverViewModel())
            .tag(Tabs.discover)
            .toolbarBackground(.hidden, for: .tabBar)
            .edgesIgnoringSafeArea(.top)
    }
}
