//
//  AuthCoordinatorProtocol.swift
//  Auth
//
//  Created by Bacho on 31.12.25.
//

import Foundation

protocol AuthCoordinatorProtocol: AnyObject {
    @MainActor func start()
    @MainActor func showSignUp()
    @MainActor func showSignIn()
    @MainActor func pop()
    @MainActor func didSignIn()
}
