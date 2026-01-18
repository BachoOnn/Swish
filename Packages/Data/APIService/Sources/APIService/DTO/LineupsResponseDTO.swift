//
//  LineupsResponseDTO.swift
//  APIService
//
//  Created by Bacho on 18.01.26.
//

import Foundation
import GameDomain

struct LineupsResponseDTO: Codable {
    let data: [LineupDTO]
    let meta: MetaDTO
}

struct LineupDTO: Codable {
    let id: Int
    let game: GameReferenceDTO
    let team: TeamDTO
    let starters: [PlayerDTO]
}

extension LineupDTO {
    func toDomain() -> Lineup {
        Lineup(
            id: id,
            game: game.toDomain(),
            team: team.toDomain(),
            starters: starters.map { $0.toDomain() }
        )
    }
}
