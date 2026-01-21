//
//  KingFisher.swift
//  Common
//
//  Created by Bacho on 21.01.26.
//

import Foundation
import SwiftUI
import UIKit
import Kingfisher


struct PlayerResponse: Codable {
    let player: [RemotePlayer]?
}

struct RemotePlayer: Codable {
    let strSport: String
    let strCutout: String?
}

enum PlayerImageService {
    static func fetchCutoutURL(for fullName: String) async -> URL? {
        let sanitizedName = fullName.replacingOccurrences(of: "-", with: " ")
        
        var components = URLComponents(string: "https://www.thesportsdb.com/api/v1/json/3/searchplayers.php")
        components?.queryItems = [
            URLQueryItem(name: "p", value: sanitizedName)
        ]
        
        guard let url = components?.url else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(PlayerResponse.self, from: data)
            
            return response.player?
                .first(where: { $0.strSport == "Basketball" })?
                .strCutout
                .flatMap { URL(string: $0) }
        } catch {
            return nil
        }
    }
}

public struct PlayerHeadshotView: View {
    let fullName: String
    @State private var url: URL?
    
    public init(fullName: String) { self.fullName = fullName }
    
    public var body: some View {
        KFImage(url)
            .placeholder { ProgressView() }
            .resizable()
            .scaledToFit()
            .task(id: fullName) {
                self.url = await PlayerImageService.fetchCutoutURL(for: fullName)
            }
    }
}

public extension UIImageView {
    @MainActor
    func setNBAHeadshot(for fullName: String) {
        self.kf.indicatorType = .activity
        
        Task {
            let url = await PlayerImageService.fetchCutoutURL(for: fullName)
            self.kf.setImage(with: url, options: [.transition(.fade(0.3))])
        }
    }
}
