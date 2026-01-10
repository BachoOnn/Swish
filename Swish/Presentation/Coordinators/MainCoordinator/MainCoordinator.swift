//
//  MainCoordinator.swift
//  Swish
//
//  Created by Bacho on 06.01.26.
//

import UIKit
import Combine

final class MainCoordinator: MainCoordinatorProtocol {
    
    @Published var navigationPath: [AppRoute] = []
    
    var onSignOut: (() -> Void)?
    
    func navigateToProfile() {
        navigationPath.append(.profile)
    }
    
    
    init() {
        print("MainCoordinator created")
    }
    deinit {
        print("MainCoordinator destroyed")
    }
    
    func navigateBack() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
    
    func signOut() {
        navigationPath.removeAll()
        onSignOut?()
    }
}
