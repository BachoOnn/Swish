//
//  GradientBackground.swift
//  Swish
//
//  Created by Bacho on 31.12.25.
//

import SwiftUI

public struct GradientBackground: View {
    
    let team: String?
    
    public init(team: String? = nil) {
        self.team = team
    }
    
    private var teamColors: [Color] {
        [
            Color("\(team ?? "")"),
            Color("\(team ?? "")").opacity(0.6),
            Color("\(team ?? "")").opacity(0.2),
        ]
    }
    
    private var defaultColors: [Color] {
        [
            Color("gradient1"),
            Color("gradient2"),
            Color("gradient3")
        ]
    }
    
    public var body: some View {
        LinearGradient(
            gradient: Gradient(colors: team == nil ? defaultColors : teamColors),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}
