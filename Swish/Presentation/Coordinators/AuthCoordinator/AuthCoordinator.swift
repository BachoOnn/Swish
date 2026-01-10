//
//  AuthCoordinator.swift
//  Swish
//
//  Created by Bacho on 31.12.25.
//

import UIKit
import SwiftUI

@MainActor
final class AuthCoordinator: AuthCoordinatorProtocol {
    private let navigationController: UINavigationController
    private let diContainer: AuthDIContainer
    
    var onAuthSuccess: (() -> Void)?
    
    init(navigationController: UINavigationController, diContainer: AuthDIContainer) {
        self.navigationController = navigationController
        self.diContainer = diContainer
        self.navigationController.navigationBar.isHidden = true
        print("AuthCoordinator created")
    }
    
    // delete thisss laterr
    deinit {
        print("🗑️ AuthCoordinator deallocated")
    }
    
    
    func start() {
        let viewModel = diContainer.makeGreetingViewModel(coordinator: self)
        let greetingVC = GreetingViewController(viewModel: viewModel)
        navigationController.setViewControllers([greetingVC], animated: false)
    }
    
    func showSignUp() {
        let viewModel = diContainer.makeSignUpViewModel(coordinator: self)
        let signUpView = SignUpView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: signUpView)
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    func showSignIn() {
        let viewModel = diContainer.makeSignInViewModel(coordinator: self)
        let signInView = SignInView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: signInView)
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    func pop() {
        navigationController.popViewController(animated: true)
    }
    
    func didSignIn() {
        onAuthSuccess?()
    }
}
