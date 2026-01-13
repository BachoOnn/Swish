//
//  CustomTabBar.swift
//  Swish
//
//  Created by Bacho on 03.12.25.
//

import SwiftUI
import Helpers

struct CustomTabBar: View {
    
    @Binding var selectedTab: Tabs
    @State private var scale = 1.0
    
    private let items = [
        TabItem(imageName: "home", buttonText: "Home", type: .home),
        TabItem(imageName: "calendar", buttonText: "Games", type: .games),
        TabItem(imageName: "search", buttonText: "Search", type: .search),
        TabItem(imageName: "ball", buttonText: "Discover", type: .discover)
    ]
    
    private let indicatorColor = Color(.label)
    
    var body: some View {
        ZStack(alignment: .bottom) {
            HStack(spacing: 0) {
                ForEach(items.indices, id: \.self) { index in
                    TabBarButton(
                        buttonText: items[index].buttonText,
                        imageName: items[index].imageName,
                        isActive: selectedTab == items[index].type,
                        scale: selectedTab == items[index].type ? scale : 1.0

                    )
                    .frame(maxWidth: .infinity)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.2, dampingFraction: 0.6)) {
                            selectedTab = items[index].type
                            scale = 1.1
                        }
                    }
                }
            }
            
            
            let tabWidth = ScreenSize.width / CGFloat(items.count)
            let indicatorX = tabWidth * CGFloat(selectedTab.rawValue) + tabWidth * 0.4
            
            Capsule()
                .fill(indicatorColor)
                .frame(width: 20, height: 3)
                .offset(x: indicatorX, y: 8)
                .shadow(color: indicatorColor, radius: 5, y: 0)
                .frame(width: ScreenSize.width, alignment: .leading)
            
        }
        .frame(maxWidth: .infinity)
        .frame(height: 80)
        .background(Color(.systemBackground).opacity(0.9))
        .shadow(color: .black.opacity(0.8), radius: 0, y: 0.5)
    }
}

#Preview {
    @Previewable @State var selectedTab: Tabs = .home
    CustomTabBar(selectedTab: $selectedTab)
        .padding(.bottom)
}
