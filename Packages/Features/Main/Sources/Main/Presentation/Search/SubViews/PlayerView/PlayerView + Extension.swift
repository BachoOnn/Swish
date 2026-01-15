//
//  PlayerView + Extension.swift
//  Main
//
//  Created by Bacho on 16.01.26.
//

import SwiftUI

extension PlayerView {
    var headerSection: some View {
        HStack {
            
            Spacer()
            
            Text("Add Favorites")
                .font(.headline)
            Button {
                viewModel.toggleFavorite()
            } label: {
                Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .frame(width: 25, height: 20)
                    .tint(.primary)
            }
        }
        .padding(.horizontal)
    }
    
    var bioSection: some View {
        HStack {
            Image("LAL", bundle: .common)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding(.trailing)
            
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(viewModel.playerName)
                    .font(.system(size: 20, weight: .bold))
                
                Group {
                    Text(viewModel.number)
                    
                    Text(viewModel.position)
                }
                .font(.system(size: 14))
                .foregroundStyle(.gray)
                
                Image("Lakers", bundle: .common)
                    .resizable()
                    .frame(width: 70, height: 70)
            }
        }
        .padding(.horizontal)
    }
    
    var pickerSection: some View {
        VStack {
            Picker("", selection: $viewModel.selectedSide) {
                ForEach(PlayerPickerSide.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            switch viewModel.selectedSide {
            case .Profile:
                ProfileSectionView(playerData: viewModel.player)
            case .Stats:
                StatsView(player: viewModel.player)
                
            }
        }
    }
}
