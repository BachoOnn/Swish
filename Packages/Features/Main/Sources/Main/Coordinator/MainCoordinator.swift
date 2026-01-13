//  MainCoordinator.swift
//  Swish
//
//  Created by Bacho on 06.01.26.
//

import UIKit
import Combine

public final class MainCoordinator: MainCoordinatorProtocol {
    
    @Published public var navigationPath: [AppRoute] = []
    
    public var onSignOut: (() -> Void)?
    
    public init() {
        print("MainCoordinator created")
    }
    
    deinit {
        print("MainCoordinator destroyed")
    }
    
    public func navigateToProfile() {
        navigationPath.append(.profile)
    }
    
    public func navigateToGameDetails(game: Game) {
        navigationPath.append(.gameDetails(game))
    }
    
    public func navigateBack() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
    
    public func signOut() {
        navigationPath.removeAll()
        onSignOut?()
    }
}
