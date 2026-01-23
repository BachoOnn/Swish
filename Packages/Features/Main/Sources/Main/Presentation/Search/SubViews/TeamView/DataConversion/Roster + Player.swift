//
//  Roster+Player.swift
//  Main
//
//  Created by Bacho on 23.01.26.
//

import PlayerDomain
import TeamDomain

extension Roster {
    func toPlayer() -> Player {
        Player(
            id: self.id,
            firstName: self.firstName,
            lastName: self.lastName,
            position: self.position,
            height: self.height,
            weight: self.weight,
            jerseyNumber: self.jerseyNumber,
            college: self.college,
            country: self.country,
            draftYear: self.draftYear,
            draftRound: self.draftRound,
            draftNumber: self.draftNumber,
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