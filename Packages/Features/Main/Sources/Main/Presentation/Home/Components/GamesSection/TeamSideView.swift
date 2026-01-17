//
//  TeamSideView.swift
//  Swish
//
//  Created by Bacho on 09.01.26.
//

import SwiftUI

struct TeamSideView: View {
    
    let team: String
    let conference: String
    
    var body: some View {
        VStack(spacing: 2) {
            Image(team)
                .resizable()
                .frame(width: 50, height: 50)
                .scaledToFit()
            
            Text(team)
                .font(.system(size: 14))
            
            Text(conference)
                .font(.system(size: 10))
                .foregroundStyle(Color(.systemGray))
        }
    }
}

#Preview {
    TeamSideView(team: "Lakers", conference: "West")
}
