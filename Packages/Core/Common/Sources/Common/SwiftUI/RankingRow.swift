//
//  RankingRow.swift
//  Common
//
//  Created by Bacho on 16.01.26.
//

import SwiftUI

public struct RankingRow: View {
    let statName: String
    let rank: Int
    let icon: String
    
    public init(statName: String, rank: Int, icon: String) {
        self.statName = statName
        self.rank = rank
        self.icon = icon
    }
    
    public var body: some View {
        HStack(spacing: 16) {
            Image(systemName: icon)
                .font(.system(size: 22))
                .foregroundStyle(.primary)
                .frame(width: 40, height: 40)
                .background(.primary.opacity(0.2))
                .clipShape(Circle())
            
            Text(statName)
                .font(.system(size: 16, weight: .medium))
            
            Spacer()
            
            HStack(spacing: 4) {
                Text("#")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(.gray)
                
                Text("\(rank)")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.primary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.primary.opacity(0.05))
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}
