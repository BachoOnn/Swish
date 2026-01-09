//
//  PosterBackground.swift
//  LaunchScreen
//
//  Created by Bacho on 31.12.25.
//

import SwiftUI

struct PosterBackground: View {
    var body: some View {
        ZStack {
            Image("poster")
                .resizable()
                .scaledToFill()
            
            Color.black.opacity(0.5)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PosterBackground()
}
