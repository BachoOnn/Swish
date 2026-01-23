//
//  RosterPlayerCard.swift
//  Main
//
//  Created by Bacho on 23.01.26.
//

import SwiftUI
import Common
import TeamDomain

struct RosterPlayerCard: View {
    let roster: Roster
    
    var body: some View {
        CustomContainer(width: 180, height: 150) {
            VStack(spacing: 5) {
                
                HStack {
                    Text("#\(roster.jerseyNumber ?? "0")")
                        .font(.system(size: 14, weight: .black))
                        .foregroundStyle(.primary)
                    Spacer()
                }
                .padding(.leading)
                
                PlayerHeadshotView(
                    fullName: "\(roster.firstName) \(roster.lastName)",
                    defaultImage: "player2"
                )
                .scaledToFit()
                .frame(width: 80, height: 80)
                
                VStack(spacing: 6) {
                    Text("\(roster.firstName) \(roster.lastName)")
                        .font(.system(size: 16, weight: .semibold))
                        .lineLimit(2)
                        .minimumScaleFactor(0.8)
                    
                    Text(roster.position)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.vertical, 8)
        }
    }
}
