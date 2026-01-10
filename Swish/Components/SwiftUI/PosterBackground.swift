//
//  PosterBackground.swift
//  Swish
//
//  Created by Bacho on 31.12.25.
//

import SwiftUI

struct PosterBackground: View {
    
    let poster: String
    
    var body: some View {
        ZStack {
            Image(poster)
                .resizable()
                .scaledToFill()
            
            Color.black.opacity(0.5)
        }
        .ignoresSafeArea()
    }
}
