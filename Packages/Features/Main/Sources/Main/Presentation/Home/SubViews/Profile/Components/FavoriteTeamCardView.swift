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
        ZStack {
            Image(team.name)
                .resizable()
                .scaledToFill()
            
        }
        .padding()
        .frame(width: 80, height: 80)
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
