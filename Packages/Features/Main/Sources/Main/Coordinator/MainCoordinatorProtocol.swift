//
//  MainCoordinatorProtocol.swift
//  Swish
//
//  Created by Bacho on 06.01.26.
//

import Foundation
import GameDomain
import TeamDomain
import PlayerDomain

public protocol MainCoordinatorProtocol: ObservableObject {
    var navigationPath: [AppRoute] { get set }
    
    func navigateToProfile()
    func navigateToGameDetails(game: Game)
    func navigateToPlayer(_ player: PlayerDomain.Player)
    func navigateToTeam(_ team: TeamDomain.Team)
    func navigateBack()
    func signOut()
}
