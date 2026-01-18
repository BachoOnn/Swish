//
//  CustomProgressView.swift
//  Common
//
//  Created by Bacho on 18.01.26.
//

import SwiftUI

struct CustomCircularProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .stroke(Color.gray.opacity(0.3), lineWidth: 10)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(configuration.fractionCompleted ?? 0))
                .stroke(Color.primary, lineWidth: 5)
                .rotationEffect(.degrees(-90))
                .animation(.linear, value: configuration.fractionCompleted)
            
            Image(systemName: "basketball.fill")
                .font(.system(size: 30 + CGFloat((configuration.fractionCompleted ?? 0) * 40)))
                .foregroundColor(.primary)
        }
    }
}

public struct CustomProgressView: View {
    @State private var progress: Double = 0
    
    public init() {}
    
    public var body: some View {
        ProgressView(value: progress, total: 1.0)
            .progressViewStyle(CustomCircularProgressViewStyle())
            .frame(width: 80, height: 80)
            .padding()
            .onAppear {
                withAnimation(.easeInOut(duration: 1.0)) {
                    progress = 1
                }
            }
    }
}
