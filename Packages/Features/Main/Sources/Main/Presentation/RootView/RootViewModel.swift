//
//  RootViewModel.swift
//  Swish
//
//  Created by Bacho on 01.01.26.
//

import Combine

@MainActor
public final class RootViewModel: ObservableObject {
    
    @Published var selectedTab: Tabs = .home
        
    public init() {}
    
}
