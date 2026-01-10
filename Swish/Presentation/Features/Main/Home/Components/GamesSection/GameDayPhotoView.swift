//
//  GameDayPhotoView.swift
//  Swish
//
//  Created by Bacho on 09.01.26.
//

import SwiftUI

struct GameDayPhotoView: View {
    let photo: String
    
    var body: some View {
        ZStack {
            
            Image("arena")
                .interpolation(.low)
                .resizable()
                .scaledToFit()
                .overlay {
                    Color.black.opacity(0.7)
                }
            
            Image(photo)
                .interpolation(.low)
                .resizable()
                .scaledToFit()
        }
    }
}

#Preview {
    GameDayPhotoView(photo: "LAL")
}
