//
//  FavoriteTeamCardView.swift
//  Main
//
//  Created by Bacho on 20.01.26.
//

import SwiftUI
import TeamDomain

struct FavoriteTeamCardView: View {
    let team: Team
    
    var body: some View {
        VStack(spacing: 5) {
            Image(team.name)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            
            Text(team.name)
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .lineLimit(1)
        }
        .padding(10)
        .frame(width: 100, height: 100)
        .background(
            Circle()
                .fill(Color(.systemBackground))
        )
        .overlay(
            Circle()
                .stroke(Color.primary.opacity(0.1), lineWidth: 1)
        )
    }
}
