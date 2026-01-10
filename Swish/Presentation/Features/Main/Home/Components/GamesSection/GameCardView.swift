//
//  GameCardView.swift
//  Swish
//
//  Created by Bacho on 09.01.26.
//

import SwiftUI

struct GameCardView: View {
    
    let homeTeam: String
    let homeAbb: String
    let visitorTeam: String
    let visitorAbb: String
    
    var body: some View {
        
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Group {
                    GameDayPhotoView(photo: homeAbb)
                    GameDayPhotoView(photo: visitorAbb)
                }
                .scaledToFit()
            }
            .overlay(alignment: .bottomLeading) {
                
                Color.black.opacity(0.4)
                    .frame(height: 30)
                HStack {
                    Text("\(homeTeam) @ \(visitorTeam)" .uppercased())
                        .font(.system(size: 23, weight: .semibold))
                        .foregroundStyle(.white)
                    Spacer()
                }
                .padding(.leading, 30)
            }
            
            ZStack {
                Color.game
                    .frame(height: 150)
                
                HStack (spacing: 60) {
                    TeamSideView(team: homeTeam)
                    
                    VStack(spacing: 10) {
                        Text("Fri, 9 January")
                            .font(.system(size: 14))
                            .foregroundStyle(Color(.systemGray))
                        Text("5:00")
                            .font(.system(size: 30, weight: .bold))
                    }
                    
                    
                    TeamSideView(team: visitorTeam)
                }
                .padding(.horizontal)
            }
        }
        .roundedCorners(20)
    }
}

#Preview {
    GameCardView(homeTeam: "Lakers", homeAbb: "LAL", visitorTeam: "Celtics", visitorAbb: "BOS")
}
