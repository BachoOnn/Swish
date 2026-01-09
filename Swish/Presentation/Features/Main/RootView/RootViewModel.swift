//
//  RootViewModel.swift
//  Auth
//
//  Created by Bacho on 01.01.26.
//

import Combine

@MainActor
final class RootViewModel: ObservableObject {
    
    @Published var selectedTab: Tabs = .home
    
    let homeViewModel: HomeViewModel
    var coordinator: MainCoordinator
    
    init(homeViewModel: HomeViewModel, coordinator: MainCoordinator) {
        self.homeViewModel = homeViewModel
        self.coordinator = coordinator
    }
    
    deinit {
        print("RootViewModel destroyed")
    }
    
    // TODO: change thiss later
    func makeProfileViewModel() -> ProfileViewModel {
        ProfileViewModel(coordinator: coordinator)
    }
}
