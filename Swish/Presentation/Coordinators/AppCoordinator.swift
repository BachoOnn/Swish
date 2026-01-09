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
    let mainCoordinator: MainCoordinator
    
    init(window: UIWindow) {
        self.window = window
        self.appDIContainer = AppDIContainer()
        
        let navigationController = UINavigationController()
        self.mainCoordinator = MainCoordinator(
            navigationController: navigationController,
            appDIContainer: appDIContainer
        )
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        mainCoordinator.start()
    }
}
