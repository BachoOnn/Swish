//
//  TeamsRepositoryProtocol.swift
//  TeamDomain
//
//  Created by Bacho on 19.01.26.
//

public protocol TeamsRepositoryProtocol {
    func fetchAllTeams() async throws -> [Team]
}
