//
//  GreetingViewModel.swift
//  Swish
//
//  Created by Bacho on 31.12.25.
//

import Foundation

@MainActor
public final class GreetingViewModel {
    private weak var coordinator: AuthCoordinatorProtocol?
    
    public init(coordinator: AuthCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    // delete this laterrr
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
