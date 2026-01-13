//
//  GradientBackground.swift
//  Swish
//
//  Created by Bacho on 31.12.25.
//

import SwiftUI

public struct GradientBackground: View {
    
    public init() {}
    
    public var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color("gradient1", bundle: .module),
                Color("gradient2", bundle: .module),
                Color("gradient3", bundle: .module)
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .ignoresSafeArea()
    }
}
