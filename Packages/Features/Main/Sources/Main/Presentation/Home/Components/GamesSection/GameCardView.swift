//
//  GameCardView.swift
//  Swish
//
//  Created by Bacho on 09.01.26.
//

import SwiftUI

struct GameCardView: View {
    
    let game: Game
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Group {
                    GameDayPhotoView(photo: game.homeTeam.abbreviation)
                    GameDayPhotoView(photo: game.visitorTeam.abbreviation)
                }
                .scaledToFit()
            }
            .overlay(alignment: .bottomLeading) {
                Color.black.opacity(0.4)
                    .frame(height: 30)
                HStack {
                    Text("\(game.homeTeam.name) @ \(game.visitorTeam.name)".uppercased())
                        .font(.system(size: 23, weight: .semibold))
                        .foregroundStyle(.white)
                    Spacer()
                }
                .padding(.leading, 30)
            }
            
            ZStack {
                Color.game
                    .frame(height: 150)
                
                HStack(spacing: 50) {
                    TeamSideView(team: game.homeTeam.name)
                    
                    VStack(spacing: 10) {
                        Text(game.formattedDate)
                            .font(.system(size: 14))
                            .foregroundStyle(Color(.systemGray))
                        
                        if game.isFinished {
                            VStack (spacing: 20){
                                Text("Final")
                                    .font(.system(size: 20, weight: .bold))
                            
                                HStack(spacing: 20) {
                                    Text("\(game.homeTeamScore)")
                                        .font(.system(size: 20, weight: .bold))
                                    
                                    Text("-")
                                        .font(.system(size: 25))

                                    Text("\(game.visitorTeamScore)")
                                        .font(.system(size: 20, weight: .bold))
                                }
                            }
                        } else {
                            Text(game.formattedTime)
                                .font(.system(size: 25, weight: .bold))
                        }
                    }
                    
                    TeamSideView(team: game.visitorTeam.name)
                }
                .padding(.horizontal)
            }
        }
        .roundedCorners(20)
    }
}

#Preview {
    GameCardView(game: MockGameData.recentGames[0])
}
