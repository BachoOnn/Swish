//
//  SignInViewModel.swift
//  Auth
//
//  Created by Bacho on 31.12.25.
//

import Combine

@MainActor
final class SignInViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var state: LoadingState = .idle
    @Published var showError = false
    @Published var errorMessage = ""
    
    // MARK: - Dependencies
    private weak var coordinator: AuthCoordinatorProtocol?
    private let authService: AuthServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Computed Properties
    var isLoading: Bool {
        if case .loading = state {
            return true
        }
        return false
    }
    
    // MARK: - Initialization
    init(coordinator: AuthCoordinatorProtocol, authService: AuthServiceProtocol) {
        self.coordinator = coordinator
        self.authService = authService
        observeState()
    }
    
    deinit {
        print("🗑️ SignInViewModel deallocated")
    }
    
    // MARK: - Combine Observation
    private func observeState() {
        $state
            .sink { [weak self] state in
                if case .error(let message) = state {
                    self?.errorMessage = message
                    self?.showError = true
                }
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Actions
    func goSignUpPage() {
        coordinator?.showSignUp()
    }
    
    func signIn(email: String, password: String) async {
        guard !email.isEmpty, !password.isEmpty else {
            state = .error("Please enter email and password")
            return
        }
        
        state = .loading
        
        do {
            let user = try await authService.signIn(email: email, password: password)
            print("✅ Signed in: \(user.email)")
            state = .success
            coordinator?.didSignIn()
        } catch {
            state = .error(error.localizedDescription)
        }
    }
    
    func signInWithGoogle() async {
        state = .loading
        
        do {
            let user = try await authService.signInWithGoogle()
            print("✅ Signed in with Google: \(user.email)")
            state = .success
            coordinator?.didSignIn()
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}
