//
//  SignInViewModel.swift
//  Auth
//
//  Created by Bacho on 31.12.25.
//

import Combine

@MainActor
final class SignInViewModel: ObservableObject {
    private weak var coordinator: AuthCoordinatorProtocol?
    
    init(coordinator: AuthCoordinatorProtocol) {
        self.coordinator = coordinator
    }
    
    // delete this
    deinit {
        print("🗑️ SignInViewModel deallocated")
    }
    
    func goSignUpPage() {
        coordinator?.showSignUp()
    }
    
    func signIn() {
        coordinator?.didSignIn()
    }
}
