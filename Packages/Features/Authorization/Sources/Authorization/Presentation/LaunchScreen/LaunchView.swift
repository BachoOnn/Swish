//
//  LaunchView.swift
//  Swish
//
//  Created by Bacho on 05.12.25.
//


import SwiftUI

public struct LaunchView: View {
    let onComplete: () -> Void
    
    public init(onComplete: @escaping () -> Void) {
        self.onComplete = onComplete
    }
    @State var yOffset: CGFloat = -500
    @State var rotation: Double = 0
    @State var opacity: Double = 1.0
    @State var textOpacity: Double = 0
    @State var scaleAmount: CGFloat = 1
    
    public var body: some View {
        ZStack {
            Color(.systemBackground)
            
            VStack(spacing: 20) {
                Image("ball")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.primary)
                    .rotationEffect(.degrees(rotation))
                    .offset(y: yOffset)
                    .opacity(opacity)
                
                Text("SWISH")
                    .font(.system(size: 60, weight: .bold, design: .default))
                    .foregroundColor(.primary)
                    .tracking(8)
                    .opacity(textOpacity)
                    .scaleEffect(scaleAmount)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            performBouncingAnimation()
        }
    }
    
    func performBouncingAnimation() {
        withAnimation(.easeIn(duration: 0.5)) {
            yOffset = 0
            rotation = 30
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            withAnimation(.easeOut(duration: 0.5)) {
                yOffset = -120
                rotation = 90
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
            withAnimation(.easeIn(duration: 0.3)) {
                yOffset = 0
                rotation = 150
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.95) {
            withAnimation(.easeOut(duration: 0.2)) {
                yOffset = -70
                rotation = 200
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
            withAnimation(.easeIn(duration: 0.2)) {
                yOffset = 0
                rotation = 220
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.35) {
            withAnimation(.easeIn(duration: 0.2)) {
                textOpacity = 1.0
                scaleAmount = 1.0
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.9) {
            withAnimation(.easeInOut(duration: 0.5)) {
                yOffset = -1000
                opacity = 0
                textOpacity = 0
                scaleAmount = 2.5
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.4) {
            withAnimation(.easeInOut(duration: 0.6)) {
                onComplete()
            }
        }
    }
}
