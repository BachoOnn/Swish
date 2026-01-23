//
//  RosterPlayerCard.swift
//  Main
//
//  Created by Bacho on 23.01.26.
//

import SwiftUI

extension RosterSectionView {
    
    var rosterContent: some View {
        ScrollView {
            VStack(spacing: 16) {
                HStack {
                    Text("Team Roster")
                        .font(.system(size: 20, weight: .heavy))
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top)
                
                LazyVGrid(
                    columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ],
                    spacing: 16
                ) {
                    ForEach(viewModel.roster, id: \.id) { roster in
                        RosterPlayerCard(roster: roster)
                            .onTapGesture {
                                viewModel.navigateToPlayer(roster)
                            }
                    }
                }
                .padding(.horizontal)
            }
        }
        .scrollIndicators(.hidden)
    }
}
