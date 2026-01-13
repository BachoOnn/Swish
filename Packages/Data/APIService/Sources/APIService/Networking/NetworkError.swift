//
//  NetworkError.swift
//  APIService
//
//  Created by Bacho on 13.01.26.
//

import Foundation

public enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case decodingFailed
    case serverError(Int)
    
    public var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .invalidResponse:
            return "Invalid server response"
        case .decodingFailed:
            return "Failed to decode data"
        case .serverError(let code):
            return "Server error with code: \(code)"
        }
    }
}
