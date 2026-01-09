//
//  HomeView.swift
//  Auth
//
//  Created by Bacho on 01.01.26.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    @State private var scrollID: Int?
    
    var body: some View {
        ZStack {
            GradientBackground()
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 20) {
                    Text("Home")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Button("Sign Out") {
                        viewModel.signOut()
                    }
                    
                }
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
