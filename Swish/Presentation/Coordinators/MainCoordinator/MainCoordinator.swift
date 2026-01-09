//
//  MainCoordinator.swift
//  Auth
//
//  Created by Bacho on 01.01.26.
//

import UIKit
import SwiftUI

@MainActor
final class MainCoordinator {
    let navigationController: UINavigationController
    private let appDIContainer: AppDIContainer
    private var authCoordinator: AuthCoordinator?
    
    init(navigationController: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationController
        self.appDIContainer = appDIContainer
        navigationController.setNavigationBarHidden(true, animated: false)
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
        
        let rootViewModel = appDIContainer.mainDIContainer.makeRootViewModel()
        
        rootViewModel.homeViewModel.onSignOut = { [weak self] in
            self?.showAuth()
        }
        
        let rootView = RootView(viewModel: rootViewModel)
        let hostingController = UIHostingController(rootView: rootView)
        
        navigationController.setViewControllers([hostingController], animated: true)
    }
}
