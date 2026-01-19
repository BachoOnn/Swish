//
//  GetTeamsUseCase.swift
//  TeamDomain
//
//  Created by Bacho on 19.01.26.
//

protocol GetTeamsUseCase {
    func execute() async throws -> [Team]
}

public struct DefaultGetTeamsUseCase: GetTeamsUseCase {
    
    private let teamsRepository: TeamsRepositoryProtocol
    
    public init(teamsRepository: TeamsRepositoryProtocol) {
        self.teamsRepository = teamsRepository
    }
    
    public func execute() async throws -> [Team] {
        let teams = try await teamsRepository.fetchAllTeams()
        
        return teams.filter {
            ["East", "West"].contains($0.conference)
        }
    }
}
