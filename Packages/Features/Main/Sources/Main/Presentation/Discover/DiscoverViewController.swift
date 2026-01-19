//
//  DiscoverViewController.swift
//  Main
//
//  Created by Bacho on 13.01.26.
//

import UIKit
import SwiftUI
import Common

final class DiscoverViewController: UIViewController {
    
    // MARK: - Properties
    let viewModel: DiscoverViewModel
    
    let headerView: UIView = {
        let view = UIView.createHeaderView()
        view.backgroundColor = .systemBackground
        return view
    }()
    
    let titleLabel1: UILabel = {
        let label = UILabel()
        label.text = "AROUND THE LEAGUE"
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel2: UILabel = {
        let label = UILabel()
        label.text = "AFFILIATE LEAGUES"
        label.textColor = .label
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    init(viewModel: DiscoverViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupBackground()
        view.addSubview(headerView)
        view.addSubview(titleLabel1)
        setupGrid()
        setupAffiliateLeagues()
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 110),
            titleLabel1.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 20),
            titleLabel1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
}

#Preview {
    DiscoverViewController(viewModel: DiscoverViewModel())
}
