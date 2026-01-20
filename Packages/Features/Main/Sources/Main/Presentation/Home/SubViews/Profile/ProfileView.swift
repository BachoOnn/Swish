//
//  ProfileView.swift
//  Swish
//
//  Created by Bacho on 06.01.26.
//

import SwiftUI
import Common

struct ProfileView: View {
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            
            headerSection
            
            ScrollView {
                VStack(spacing: 20) {
                    imageSection
                    
                    subscriptionSection
                    
                    favoritesSection
                }
            }
            .scrollIndicators(.hidden)
        }
        .toolbar(.hidden, for: .navigationBar)
        .onAppear {
            viewModel.loadFavoriteTeams()
        }
    }
}
