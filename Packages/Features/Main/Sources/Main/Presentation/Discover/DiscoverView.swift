//
//  DiscoverView.swift
//  Swish
//
//  Created by Bacho on 01.01.26.
//

import SwiftUI
import Common

struct DiscoverView: UIViewControllerRepresentable {
    
    let viewModel: DiscoverViewModel

    func makeUIViewController(context: Context) -> DiscoverViewController {
        DiscoverViewController(viewModel: viewModel)
    }
    
    func updateUIViewController(_ uiViewController: DiscoverViewController, context: Context) {
    }
    
    typealias UIViewControllerType = DiscoverViewController
}
