//
//  NewsRepositoryProtocol.swift
//  NewsDomain
//
//  Created by Bacho on 18.01.26.
//

public protocol NewsRepositoryProtocol {
    func getNews() async throws -> [News]
}
