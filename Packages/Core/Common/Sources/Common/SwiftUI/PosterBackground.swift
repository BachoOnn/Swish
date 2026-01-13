//
//  PosterBackground.swift
//  Swish
//
//  Created by Bacho on 31.12.25.
//

import SwiftUI

public struct PosterBackground: View {
    
    let poster: String
    
    public init(poster: String) {
        self.poster = poster
    }
    
    public var body: some View {
        ZStack {
            Image("\(poster)", bundle: .module)
                .resizable()
                .scaledToFill()
            
            Color.black.opacity(0.5)
        }
        .ignoresSafeArea()
    }
}
