//
//  TeamDTO.swift
//  APIService
//
//  Created by Bacho on 19.01.26.
//

import GameDomain

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
    func toDomain() -> Team {
        Team(
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
