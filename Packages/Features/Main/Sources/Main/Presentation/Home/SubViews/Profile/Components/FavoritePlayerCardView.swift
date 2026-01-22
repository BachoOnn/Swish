//
//  FavoritePlayerCardView.swift
//  Main
//
//  Created by Bacho on 20.01.26.
//

import SwiftUI
import PlayerDomain
import Common

struct FavoritePlayerCardView: View {
    let player: Player
    
    var body: some View {
        ZStack {
            PlayerHeadshotView(fullName: "\(player.firstName) \(player.lastName)", defaultImage: "player1")
                .scaledToFit()
                .padding()
                .frame(width: 80, height: 80)
            
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

