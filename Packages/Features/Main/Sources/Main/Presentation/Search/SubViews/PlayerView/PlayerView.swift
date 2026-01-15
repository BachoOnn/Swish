//
//  PlayerView.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import SwiftUI
import Common

struct PlayerView: View {
    
    @StateObject var viewModel: PlayerViewModel
    
    var body: some View {
        ZStack {
            GradientBackground()
            
            VStack {
                headerSection
                
                bioSection
                
                pickerSection
                
                Spacer()
            }
        }
    }
}

#Preview {
    PlayerView(viewModel: PlayerViewModel(player: .lebronMock))
}
