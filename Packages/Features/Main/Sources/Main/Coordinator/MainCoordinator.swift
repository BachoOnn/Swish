//  MainCoordinator.swift
//  Swish
//
//  Created by Bacho on 06.01.26.
//

import UIKit
import Combine
import GameDomain
import TeamDomain
import PlayerDomain

public final class MainCoordinator: MainCoordinatorProtocol {

    @Published public var navigationPath: [AppRoute] = []
    
    public var onSignOut: (() -> Void)?
    
    public init() {}
    
    public func navigateToProfile() {
        navigationPath.append(.profile)
    }
    
    public func navigateToGameDetails(game: Game) {
        navigationPath.append(.gameDetails(game))
    }
    
    public func navigateToPlayer(_ player: PlayerDomain.Player) {
        navigationPath.append(.player(player))
    }
    
    public func navigateToTeam(_ team: TeamDomain.Team) {
        navigationPath.append(.team(team))
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
