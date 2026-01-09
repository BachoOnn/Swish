//
//  HomeViewModel.swift
//  Auth
//
//  Created by Bacho on 01.01.26.
//

import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    
    private weak var coordinator: MainCoordinator?
    
    
    init(coordinator: MainCoordinator) {
        self.coordinator = coordinator
    }
    
    deinit {
        print("HomeViewModel destroyed")
    }
    
    func navigateToProfile() {
        coordinator?.navigateToProfile()
    }
    
    func signOut() {
        coordinator?.signOut()
    }
}
