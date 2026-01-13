//
//  SignInViewModel.swift
//  Swish
//
//  Created by Bacho on 31.12.25.
//

import Combine
import Helpers
import AuthDomain

@MainActor
public final class SignInViewModel: ObservableObject {
    
    // MARK: - Published Properties
    @Published var state: LoadingState = .idle
    @Published var showError = false
    @Published var errorMessage = ""
    
    // MARK: - Dependencies
    private let signInUseCase: DefaultSignInUseCase
    private let googleSignInUseCase: DefaultGoogleSignInUseCase
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
    public init(coordinator: AuthCoordinatorProtocol, signInUseCase: DefaultSignInUseCase, googleSignInUseCase: DefaultGoogleSignInUseCase) {
        self.coordinator = coordinator
        self.signInUseCase = signInUseCase
        self.googleSignInUseCase = googleSignInUseCase
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
        state = .loading
        
        do {
            let user = try await signInUseCase.execute(email: email, password: password)
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
            let user = try await googleSignInUseCase.execute()
            print("✅ Signed in with Google: \(user.email)")
            state = .success
            coordinator?.didSignIn()
        } catch {
            state = .error(error.localizedDescription)
        }
    }
}
