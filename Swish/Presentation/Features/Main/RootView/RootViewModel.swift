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
    
    init(homeViewModel: HomeViewModel) {
        self.homeViewModel = homeViewModel
    }
}
