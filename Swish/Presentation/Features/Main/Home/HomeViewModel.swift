//
//  HomeViewModel.swift
//  Auth
//
//  Created by Bacho on 01.01.26.
//

import Combine

@MainActor
final class HomeViewModel: ObservableObject {
    var onSignOut: (() -> Void)?
    
    func signOut() {
        onSignOut?()
    }
}
