//
//  BackButton.swift
//  RickNMorty
//
//  Created by Bacho on 05.12.25.
//

import SwiftUI

struct BackButton: View {
    let action: () -> Void
    
    var body: some View {
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
#Preview {
    BackButton(action: {})
}
