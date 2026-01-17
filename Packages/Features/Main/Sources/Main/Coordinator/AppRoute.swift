//
//  AppRoute.swift
//  Swish
//
//  Created by Bacho on 06.01.26.
//

import GameDomain

public enum AppRoute: Hashable, Equatable {
    case profile
    case gameDetails(Game)
    case player(PlayerSeasonAverages)
    case team(TeamSeasonAverages)
}
