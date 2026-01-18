//
//  GameCardView.swift
//  Swish
//
//  Created by Bacho on 09.01.26.
//

import SwiftUI
import Common
import Helpers
import GameDomain

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
                    TeamSideView(team: game.homeTeam.name, conference: game.homeTeam.conference)
                    
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
                        } else if game.isLive{
                            VStack {
                                Text(game.status)
                                    .font(.system(size: 16, weight: .bold))
                                    .foregroundStyle(.red)
                                
                                HStack {
                                    Text(String(game.homeTeamScore))
                                        .font(.system(size: 14, design: .monospaced))
                                    Text("-")
                                    
                                    Text(String(game.visitorTeamScore))
                                        .font(.system(size: 14, design: .monospaced))
                                }
                            }
                        } else {
                            Text(game.formattedTime)
                                .font(.system(size: 25, weight: .bold))
                        }
                    }
                    
                    TeamSideView(team: game.visitorTeam.name, conference: game.visitorTeam.conference)
                }
                .padding(.horizontal)
            }
        }
        .roundedCorners(20)
    }
}
