//
//  GetRostersUseCase.swift
//  TeamDomain
//
//  Created by Bacho on 23.01.26.
//

protocol GetRostersUseCase {
    func execute(teamId: Int) async throws -> [Roster]
}

public struct DefaultGetRostersUseCase: GetRostersUseCase {
    
    private let teamRepository: TeamsRepositoryProtocol
    
    public init(teamRepository: TeamsRepositoryProtocol) {
        self.teamRepository = teamRepository
    }
    
    public func execute(teamId: Int) async throws -> [Roster] {
        try await teamRepository.fetchRosters(teamId: teamId)
    }
}
