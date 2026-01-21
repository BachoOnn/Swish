//
//  SummaryViewController.swift
//  Main
//
//  Created by Bacho on 18.01.26.
//

import UIKit
import GameDomain
import PlayerDomain
import Combine

final class SummaryViewController: UIViewController {
    
    // MARK: - Properties
    weak var viewModel: GameDetailsViewModel?
    var cancellables = Set<AnyCancellable>()
    
    // MARK: - UI Components
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let contentStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 20
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let quarterScoresView: QuarterScoresView = {
        let view = QuarterScoresView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        return view
    }()
    
    let startersView: StartersView = {
        let view = StartersView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let topPerformersView: TopPerformersView = {
        let view = TopPerformersView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        topPerformersView.showLoading()
        setupBindings()
        loadData()
    }
    
    
    func configure(with game: Game, viewModel: GameDetailsViewModel) {
        self.viewModel = viewModel
        quarterScoresView.configure(with: game)
        topPerformersView.onPlayerTap = { [weak self] player in
            self?.viewModel?.goPlayersDetails(from: player)
        }
    }
    
    private func loadData() {
        guard let viewModel = viewModel else { return }
        DispatchQueue.main.async(execute: viewModel.onSummaryLoad)
    }
}
