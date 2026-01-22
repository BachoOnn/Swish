//
//  ProfileSectionView.swift
//  Main
//
//  Created by Bacho on 15.01.26.
//

import SwiftUI
import Common
import PlayerDomain

struct ProfileSectionView: View {
    let playerData: Player
    
    var body: some View {
        ScrollView {
            VStack {
                upperSection

                bioSection
            }
        }
        .scrollIndicators(.hidden)
    }
}
