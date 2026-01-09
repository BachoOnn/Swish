//
//  HeaderView.swift
//  Auth
//
//  Created by Bacho on 06.01.26.
//

import SwiftUI

struct HeaderView: View {
    
    let action: () -> Void
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
            
            HStack {
                Image("ball")
                    .resizable()
                    .frame(width: 25, height: 25)
                
                Text("SWISH")
                    .font(.system(size: 30, weight: .bold))
                
                Spacer()
                
                Button {
                    action()
                } label: {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 25))
                        .tint(.primary)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 40)
        }
    }
}

#Preview {
    HeaderView(action: {})
}
