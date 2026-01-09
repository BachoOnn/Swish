//
//  GradientBackground.swift
//  LaunchScreen
//
//  Created by Bacho on 31.12.25.
//


import SwiftUI

struct GradientBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                .gradient1,
                .gradient2,
                .gradient3
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}
