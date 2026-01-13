//
//  TeamSideView.swift
//  Swish
//
//  Created by Bacho on 09.01.26.
//

import SwiftUI

struct TeamSideView: View {
    
    let team: String
    
    var body: some View {
        VStack(spacing: 2) {
            Image(team)
                .resizable()
                .frame(width: 60, height: 60)
            
            Text(team)
                .font(.system(size: 14))
            
            Text("30-12")
                .font(.system(size: 10))
                .foregroundStyle(Color(.systemGray))
        }
    }
}

#Preview {
    TeamSideView(team: "Lakers")
}
