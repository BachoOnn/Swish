//
//  OnLoadViewModifier.swift
//  Helpers
//
//  Created by Bacho on 22.01.26.
//

import SwiftUI

struct OnLoadViewModifier: ViewModifier {
    
    @State private var didLoad = false
    private let action: (() -> Void)?
    
    init(perform action: (() -> Void)? = nil) {
        self.action = action
    }
    
    func body(content: Content) -> some View {
        content.onAppear {
            if didLoad == false {
                didLoad = true
                action?()
            }
        }
    }
    
}

extension View {
    public func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(OnLoadViewModifier(perform: action))
    }
}
