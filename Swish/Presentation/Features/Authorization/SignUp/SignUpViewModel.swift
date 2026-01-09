//
//  SignUpViewModel.swift
//  Auth
//
//  Created by Bacho on 31.12.25.
//

import Combine

@MainActor
final class SignUpViewModel: ObservableObject {
    
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
        print("🗑️ SignUpViewModel deallocated")
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
    func goSingInPage() {
        coordinator?.pop()
    }
    
    func signUp(email: String, password: String, confirmPassword: String, firstName: String, lastName: String) async {
        guard !email.isEmpty, !password.isEmpty, !firstName.isEmpty, !lastName.isEmpty else {
            state = .error("Please fill in all fields")
            return
        }
        
        guard password == confirmPassword else {
            state = .error("Passwords don't match")
            return
        }
        
        guard password.count >= 6 else {
            state = .error("Password must be at least 6 characters")
            return
        }
        
        state = .loading
        
        do {
            let user = try await authService.signUp(email: email, password: password)
            print("✅ Signed up: \(user.email)")
            state = .success
            coordinator?.didSignIn()
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}
