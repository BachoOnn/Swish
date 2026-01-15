//
//  CustomContainer.swift
//  Common
//
//  Created by Bacho on 15.01.26.
//

import SwiftUI

public struct CustomContainer<Content: View>: View {
    public let content: Content
    public let width: CGFloat?
    public let height: CGFloat?
    
    public init(
        width: CGFloat,
        height: CGFloat,
        @ViewBuilder content: () -> Content
    ) {
        self.width = width
        self.height = height
        self.content = content()
    }
    
    public var body: some View {
        content
            .frame(width: width, height: height)
            .background(.clear)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.primary, lineWidth: 1).opacity(0.7)
            )
    }
}
