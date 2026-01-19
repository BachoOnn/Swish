//
//  TeamDTO.swift
//  APIService
//
//  Created by Bacho on 19.01.26.
//

import GameDomain
import TeamDomain

typealias DomainTeam = TeamDomain.Team
typealias GameTeam = GameDomain.Team

struct TeamResponseDTO: Codable {
    let data: [TeamDTO]
}

struct TeamDTO: Codable {
    let id: Int
    let conference: String
    let division: String
    let city: String
    let name: String
    let fullName: String
    let abbreviation: String
    
    enum CodingKeys: String, CodingKey {
        case id, conference, division, city, name, abbreviation
        case fullName = "full_name"
    }
}

struct MetaDTO: Codable {
    let perPage: Int
    
    enum CodingKeys: String, CodingKey {
        case perPage = "per_page"
    }
}

extension TeamDTO {
    public func toDomain() -> DomainTeam {
        DomainTeam(
            id: id,
            conference: conference,
            division: division,
            city: city,
            name: name,
            fullName: fullName,
            abbreviation: abbreviation
        )
    }
    
    public func toGameDomain() -> GameTeam {
        GameTeam(
            id: id,
            conference: conference,
            division: division,
            city: city,
            name: name,
            fullName: fullName,
            abbreviation: abbreviation
        )
    }
}
