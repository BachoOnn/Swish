//
//  SummaryViewController.swift
//  Main
//
//  Created by Bacho on 18.01.26.
//

import UIKit
import GameDomain

class SummaryViewController: UIViewController {
    
    // MARK: - UI Components
    private let contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let quarterScoresView: QuarterScoresView = {
        let view = QuarterScoresView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    private let topPerformersView: TopPerformersView = {
        let view = TopPerformersView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(contentStackView)
        contentStackView.addArrangedSubview(quarterScoresView)
        contentStackView.addArrangedSubview(topPerformersView)
        
        NSLayoutConstraint.activate([
            contentStackView.topAnchor.constraint(equalTo: view.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configure(with game: Game) {
        quarterScoresView.configure(with: game)
        //TODO: add top performers
    }
}
