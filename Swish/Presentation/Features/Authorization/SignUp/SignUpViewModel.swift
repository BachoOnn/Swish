//
//  SignUpViewModel.swift
//  Auth
//
//  Created by Bacho on 31.12.25.
//

import Combine

@MainActor
final class SignUpViewModel: ObservableObject {
    
    private weak var coordinator: AuthCoordinatorProtocol?
    
    init(coordinator: AuthCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    // delete this
    deinit {
        print("🗑️ SignUpViewModel deallocated")
    }
    
    func goSingInPage() {
        coordinator?.showSignIn()
    }
}
