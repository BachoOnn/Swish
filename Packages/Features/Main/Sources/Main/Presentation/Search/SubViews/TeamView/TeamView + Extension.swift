//
//  TeamView + Extension.swift
//  Main
//
//  Created by Bacho on 16.01.26.
//

import SwiftUI
import Common
import TeamDomain

extension TeamView {
    
    var headerSection: some View {
        HStack {
            
            Spacer()
            
            Text("Add To Favorites")
                .font(.caption)
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
    
    var teamInfoSection: some View {
        VStack(spacing: 10) {
            Image(viewModel.team.name)
                .resizable()
                .scaledToFit()
                .frame(width: 170, height: 170)
            
            Text(viewModel.team.fullName)
                .font(.system(size: 28, weight: .bold))
            
            HStack(spacing: 20) {
                HStack(spacing: 6) {
                    Image(systemName: "mappin.and.ellipse.circle.fill")
                        .font(.system(size: 14))
                        .foregroundStyle(.secondary)
                    Text("\(viewModel.team.conference) • \(viewModel.team.division)")
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding(.horizontal)
    }
    
    var pickerSection: some View {
        VStack {
            Picker("", selection: $viewModel.selectedSide) {
                ForEach(TeamPickerSide.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            switch viewModel.selectedSide {
            case .Stats:
                TeamStatsView(viewModel: viewModel)
            case .Roster:
                RosterSectionView(viewModel: viewModel)
            }
        }
    }
}
