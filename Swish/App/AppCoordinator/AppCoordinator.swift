//
//  AppCoordinator.swift
//  Swish
//
//  Created by Bacho on 31.12.25.
//


import UIKit

@MainActor
final class AppCoordinator {
    let window: UIWindow
    let initialCoordinator: InitialCoordinator
    
    init(window: UIWindow) {
        self.window = window
        
        let navigationController = UINavigationController()
        self.initialCoordinator = InitialCoordinator(
            navigationController: navigationController
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
