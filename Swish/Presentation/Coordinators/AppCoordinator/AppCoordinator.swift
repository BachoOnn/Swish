//
//  AppCoordinator.swift
//  Auth
//
//  Created by Bacho on 31.12.25.
//

import UIKit

@MainActor
final class AppCoordinator {
    let window: UIWindow
    let appDIContainer: AppDIContainer
    let initialCoordinator: InitialCoordinator
    
    init(window: UIWindow) {
        self.window = window
        self.appDIContainer = AppDIContainer()
        
        let navigationController = UINavigationController()
        self.initialCoordinator = InitialCoordinator(
            navigationController: navigationController,
            appDIContainer: appDIContainer
        )
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    deinit {
        print("AppCoordinator deallocated")
    }
    
    func start() {
        initialCoordinator.start()
    }
}
