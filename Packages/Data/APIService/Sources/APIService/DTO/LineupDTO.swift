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
    let team: TeamDTO
    let starters: [PlayerDTO]
    
    enum CodingKeys: String, CodingKey {
        case id, team, starters
    }
}

extension LineupDTO {
    func toDomain() -> Lineup {
        Lineup(
            id: id,
            game: nil, 
            team: team.toGameDomain(),
            starters: starters.map { $0.toDomain() }
        )
    }
}
