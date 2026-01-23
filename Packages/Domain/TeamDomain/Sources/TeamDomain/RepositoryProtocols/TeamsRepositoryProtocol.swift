//
//  TeamsRepositoryProtocol.swift
//  TeamDomain
//
//  Created by Bacho on 19.01.26.
//

public protocol TeamsRepositoryProtocol {
    func fetchAllTeams() async throws -> [Team]
    func fetchTeamStats(teamId: Int) async throws -> TeamSeasonStats
    func fetchRosters(teamId: Int) async throws -> [Roster]
}
