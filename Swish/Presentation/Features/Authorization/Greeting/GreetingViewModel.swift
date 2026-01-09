//
//  GreetingViewModel.swift
//  Auth
//
//  Created by Bacho on 31.12.25.
//

import Foundation

@MainActor
final class GreetingViewModel {
    private weak var coordinator: AuthCoordinatorProtocol?
    
    init(coordinator: AuthCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    // delete this
    deinit {
        print("🗑️ GreetingViewModel deallocated")
    }
    
    func getStartedTapped() {
        coordinator?.showSignUp()
    }
    
    func signInTapped() {
        coordinator?.showSignIn()
    }
}
