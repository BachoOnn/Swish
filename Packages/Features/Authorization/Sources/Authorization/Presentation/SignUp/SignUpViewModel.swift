//
//  SignUpViewModel.swift
//  Swish
//
//  Created by Bacho on 31.12.25.
//

import Combine
import Helpers
import AuthDomain

@MainActor
public final class SignUpViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var state: LoadingState = .idle
    @Published var showError = false
    @Published var errorMessage = ""
    
    // MARK: - Dependencies
    private let signUpUseCase: DefaultSignUpUseCase
    private weak var coordinator: AuthCoordinatorProtocol?
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Computed Properties
    var isLoading: Bool {
        if case .loading = state {
            return true
        }
        return false
    }
    
    // MARK: - Initialization
    public init(coordinator: AuthCoordinatorProtocol, signUpUseCase: DefaultSignUpUseCase) {
        self.coordinator = coordinator
        self.signUpUseCase = signUpUseCase
        observeState()
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
        state = .loading
        
        do {
            let user = try await signUpUseCase.execute(
                email: email,
                password: password,
                confirmPassword: confirmPassword,
                firstName: firstName,
                lastName: lastName
            )
            state = .success
            coordinator?.didSignIn()
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}
