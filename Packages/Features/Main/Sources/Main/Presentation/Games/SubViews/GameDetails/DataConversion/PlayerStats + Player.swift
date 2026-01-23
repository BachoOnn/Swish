//
//  PlayerStats + Player.swift
//  Main
//
//  Created by Bacho on 23.01.26.
//

import PlayerDomain
import GameDomain

extension PlayerStats {
    func toPlayer() -> PlayerDomain.Player {
        Player(
            id: self.player.id,
            firstName: self.player.firstName,
            lastName: self.player.lastName,
            position: self.player.position,
            height: nil,
            weight: nil,
            jerseyNumber: self.player.jerseyNumber,
            college: nil,
            country: nil,
            draftYear: nil,
            draftRound: nil,
            draftNumber: nil,
            team: PlayerTeamInfo(
                id: self.team.id,
                conference: self.team.conference,
                division: self.team.division,
                city: self.team.city,
                name: self.team.name,
                fullName: self.team.fullName,
                abbreviation: self.team.abbreviation
            )
        )
    }
}
