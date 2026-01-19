//
//  AppRoute.swift
//  Swish
//
//  Created by Bacho on 06.01.26.
//

import GameDomain
import TeamDomain
import PlayerDomain

public enum AppRoute: Hashable, Equatable {
    case profile
    case gameDetails(Game)
    case player(PlayerDomain.Player)
    case team(TeamDomain.Team)
}
