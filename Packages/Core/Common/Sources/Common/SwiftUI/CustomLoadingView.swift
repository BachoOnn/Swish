//
//  CustomLoadingView.swift
//  Common
//
//  Created by Bacho on 21.01.26.
//

import SwiftUI

public struct CustomLoadingView: View {
    let message: String
    
    public init(message: String = "Loading...") {
        self.message = message
    }
    
    public var body: some View {
        VStack {
            Spacer()
            CustomProgressView()
            Text(message)
                .font(.subheadline)
                .fontDesign(.monospaced)
                .padding(.top, 8)
            Spacer()
        }
    }
}
