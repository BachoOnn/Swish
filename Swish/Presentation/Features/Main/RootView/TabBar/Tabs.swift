//
//  Tabs.swift
//  RickNMorty
//
//  Created by Bacho on 03.12.25.
//


import SwiftUI

enum Tabs: Int {
    case home = 0
    case games = 1
    case search = 2
    case discover = 3
}

struct TabItem {
    let imageName: String
    let buttonText: String
    let type: Tabs
}
