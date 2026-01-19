//
//  GetTeamStatsUseCase.swift
//  TeamDomain
//
//  Created by Bacho on 19.01.26.
//

protocol GetTeamStatsUseCase {
    func execute(teamsID: Int) async throws -> TeamSeasonStats
}

public struct DefaultGetTeamStatsUseCase: GetTeamStatsUseCase {
    
    private let teamRepository: TeamsRepositoryProtocol
    
    public init(teamRepository: TeamsRepositoryProtocol) {
        self.teamRepository = teamRepository
    }
    
    public func execute(teamsID: Int) async throws -> TeamSeasonStats {
        let result = try await teamRepository.fetchTeamStats(teamId: teamsID)
        
        return result
    }
}
