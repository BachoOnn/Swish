//
//  FavoritePlayerCardView.swift
//  Main
//
//  Created by Bacho on 20.01.26.
//

import SwiftUI
import PlayerDomain

struct FavoritePlayerCardView: View {
    let player: Player
    
    var body: some View {
        ZStack {
            Image(player.team.abbreviation) // TODO: change to kingfisher
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
            
        }
        .padding()
        .frame(width: 70, height: 70)
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

