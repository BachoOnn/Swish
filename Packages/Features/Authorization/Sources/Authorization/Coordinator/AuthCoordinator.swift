//
//  AuthCoordinator.swift
//  Swish
//
//  Created by Bacho on 31.12.25.
//

import UIKit
import SwiftUI

@MainActor
public final class AuthCoordinator: AuthCoordinatorProtocol {
    private var navigationController: UINavigationController?
    private let diContainer: AuthDIContainer
    
    public var onAuthSuccess: (() -> Void)?
    
    public init() {
        self.diContainer = AuthDIContainer()
    }
    
    public func setNavigationController(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = true
    }
    
    public func start() {
        guard let navigationController = navigationController else { return }
        let viewModel = diContainer.makeGreetingViewModel(coordinator: self)
        let greetingVC = GreetingViewController(viewModel: viewModel)
        navigationController.setViewControllers([greetingVC], animated: false)
    }
    
    public func showSignUp() {
        guard let navigationController = navigationController else { return }
        let viewModel = diContainer.makeSignUpViewModel(coordinator: self)
        let signUpView = SignUpView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: signUpView)
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    public func showSignIn() {
        guard let navigationController = navigationController else { return }
        let viewModel = diContainer.makeSignInViewModel(coordinator: self)
        let signInView = SignInView(viewModel: viewModel)
        let hostingController = UIHostingController(rootView: signInView)
        navigationController.pushViewController(hostingController, animated: true)
    }
    
    public func pop() {
        navigationController?.popViewController(animated: true)
    }
    
    public func didSignIn() {
        onAuthSuccess?()
    }
}
