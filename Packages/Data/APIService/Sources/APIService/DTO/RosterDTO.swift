//
//  RosterDTO.swift
//  APIService
//
//  Created by Bacho on 23.01.26.
//

import TeamDomain

public struct RosterResponseDTO: Codable {
    let data: [RosterDTO]
    let meta: MetaDTO
}

public struct RosterDTO: Codable {
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
    let team: TeamDTO?
    
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

extension RosterDTO {
    public func toDomain() -> Roster {
        Roster(
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
            team: team?.toDomain() ?? Team(
                id: 0,
                conference: "",
                division: "",
                city: "",
                name: "",
                fullName: "",
                abbreviation: ""
            )
        )
    }
}
