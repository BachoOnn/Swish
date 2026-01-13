//
//  BackButton.swift
//  Swish
//
//  Created by Bacho on 05.12.25.
//

import SwiftUI

public struct BackButton: View {
    let action: () -> Void
    
    public init(action: @escaping () -> Void) {
        self.action = action
    }
    
    public var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: "chevron.backward.chevron.backward.dotted")
                .resizable()
                .frame(width: 20, height: 20)
                .tint(.primary)
        }
    }
}
