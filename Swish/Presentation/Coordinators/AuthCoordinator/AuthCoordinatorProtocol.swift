//
//  AuthCoordinatorProtocol.swift
//  Swish
//
//  Created by Bacho on 31.12.25.
//

import UIKit

protocol AuthCoordinatorProtocol: AnyObject {
    @MainActor func start()
    @MainActor func showSignUp()
    @MainActor func showSignIn()
    @MainActor func pop()
    @MainActor func didSignIn()
}
