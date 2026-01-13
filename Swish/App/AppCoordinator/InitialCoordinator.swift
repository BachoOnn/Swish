//
//  InitialCoordinator.swift
//  Swish
//
//  Created by Bacho on 01.01.26.
//


import UIKit
import SwiftUI
import Authorization
import Main 

@MainActor
final class InitialCoordinator {
    let navigationController: UINavigationController
    private var authCoordinator: AuthCoordinator?
    private var mainDIContainer: MainDIContainer?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
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
        let authCoordinator = AuthCoordinator()
        authCoordinator.setNavigationController(navigationController)
        authCoordinator.onAuthSuccess = { [weak self] in
            self?.showMainApp()
        }
        self.authCoordinator = authCoordinator
        authCoordinator.start()
    }
    
    func showMainApp() {
        authCoordinator = nil
        
        // Main package - self-contained
        let mainDIContainer = MainDIContainer()
        self.mainDIContainer = mainDIContainer
        
        mainDIContainer.coordinator.onSignOut = { [weak self] in
            self?.showAuth()
        }
        
        let rootView = RootView(container: mainDIContainer)
        let hostingController = UIHostingController(rootView: rootView)
        
        navigationController.setViewControllers([hostingController], animated: true)
    }
}
