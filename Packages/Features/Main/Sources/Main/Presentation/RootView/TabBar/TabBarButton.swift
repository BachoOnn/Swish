//
//  TabBarButton.swift
//  Swish
//
//  Created by Bacho on 03.12.25.
//

import SwiftUI

struct TabBarButton: View {
    
    var buttonText: String
    var imageName: String
    var isActive: Bool
    var scale: CGFloat
    
    var body: some View {
        VStack(spacing: 10) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 23, height: 23)
                .scaleEffect(scale)
                .symbolVariant(isActive ? .fill : .none)
                .foregroundStyle(isActive ? .primary : .secondary)
            
            Text(buttonText)
                .font(.system(size: 10, weight: .medium))
                .foregroundStyle(isActive ? .primary : .secondary)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
        TabBarButton(
            buttonText: "Profile",
            imageName: "home",
            isActive: true,
            scale: 1.0
        )
        .frame(width: 100, height: 60)
}
