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
                    .padding(.vertical)
                
                bioSection
                
                pickerSection
                
                Spacer()
            }
        }
    }
}

extension PlayerView {
    var headerSection: some View {
        HStack {
            BackButton {
                
            }
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
                
                Text("Lebron James")
                    .font(.system(size: 20, weight: .bold))
                
                Group {
                    Text("№23")
                    
                    Text("Guard-Forward")
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
                    ProfileSectionView()
            case .Stats:
                ScrollView {
                    VStack {
                        Text("Stats Here")
                    }
                }
            }
        }
    }
}

#Preview {
    PlayerView(viewModel: PlayerViewModel())
}
