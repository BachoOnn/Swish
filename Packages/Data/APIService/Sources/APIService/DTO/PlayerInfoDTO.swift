//
//  PlayerDTO.swift
//  APIService
//
//  Created by Bacho on 19.01.26.
//

import PlayerDomain

public struct PlayerResponseDTO: Codable {
    let data: [PlayerDTO]
    let meta: MetaDTO
}

public struct PlayerDTO: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let position: String
    let height: String?
    let weight: String?
    let jerseyNumber: String?
    let college: String?
    let country: String?
    let draftYear: Int?
    let draftRound: Int?
    let draftNumber: Int?
    let team: PlayerTeamInfoDTO
    
    enum CodingKeys: String, CodingKey {
        case id, team
        case firstName = "first_name"
        case lastName = "last_name"
        case position, height, weight
        case jerseyNumber = "jersey_number"
        case college, country
        case draftYear = "draft_year"
        case draftRound = "draft_round"
        case draftNumber = "draft_number"
    }
}

public struct PlayerTeamInfoDTO: Codable {
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

extension PlayerTeamInfoDTO {
    public func toDomain() -> PlayerTeamInfo {
        PlayerTeamInfo(
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

extension PlayerDTO {
    public func toDomain() -> Player {
        Player(
            id: id,
            firstName: firstName,
            lastName: lastName,
            position: position,
            height: height,
            weight: weight,
            jerseyNumber: jerseyNumber,
            college: college,
            country: country,
            draftYear: draftYear,
            draftRound: draftRound,
            draftNumber: draftNumber,
            team: team.toDomain()
        )
    }
}
