//
//  InitialCoordinator.swift
//  Swish
//
//  Created by Bacho on 01.01.26.
//

import UIKit
import SwiftUI

@MainActor
final class InitialCoordinator {
    let navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    private var authCoordinator: AuthCoordinatorProtocol?
    
    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
        navigationController.setNavigationBarHidden(true, animated: false)
        print("InitialCoordinator created")

    }
    
    deinit {
        print("InitialCoordinator deallocated")
    }
    
    func start() {
        showLaunchScreen()
    }
    
    func showLaunchScreen() {
        let launchView = LaunchView { [weak self] in
            self?.showAuth()
        }
        let hostingController = UIHostingController(rootView: launchView)
        navigationController.setViewControllers([hostingController], animated: false)
    }
    
    func showAuth() {
        let authCoordinator = AuthCoordinator(
            navigationController: navigationController,
            diContainer: appDIContainer.authDIContainer
        )
        authCoordinator.onAuthSuccess = { [weak self] in
            self?.showMainApp()
        }
        self.authCoordinator = authCoordinator
        authCoordinator.start()
    }
    
    func showMainApp() {
        authCoordinator = nil
        
        let mainCoordinator = appDIContainer.mainDIContainer.coordinator
        mainCoordinator.onSignOut = { [weak self] in
            self?.showAuth()
        }
        
        let rootViewModel = appDIContainer.mainDIContainer.makeRootViewModel()
        let rootView = RootView(viewModel: rootViewModel)
        let hostingController = UIHostingController(rootView: rootView)
        
        
        navigationController.setViewControllers([hostingController], animated: true)
    }
}
