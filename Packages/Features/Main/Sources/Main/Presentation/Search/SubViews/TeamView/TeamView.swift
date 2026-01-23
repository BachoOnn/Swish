//
//  TeamView.swift
//  Main
//
//  Created by Bacho on 16.01.26.
//

import SwiftUI
import Common
import Helpers

struct TeamView: View {
    
    @StateObject var viewModel: TeamViewModel
    
    var body: some View {
        ZStack {
            GradientBackground(team: viewModel.team.name)
            
            VStack {
                headerSection
                
                teamInfoSection
                
                pickerSection
            }
        }
    }
}
