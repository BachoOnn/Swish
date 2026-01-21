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

class SummaryViewController: UIViewController {
    
    // MARK: - Properties
    weak var viewModel: GameDetailsViewModel?
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - UI Components
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
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
    
    private let startersView: StartersView = {
        let view = StartersView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let topPerformersView: TopPerformersView = {
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
    
    private func setupUI() {
        view.backgroundColor = .clear
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        contentStackView.addArrangedSubview(quarterScoresView)
        contentStackView.addArrangedSubview(startersView)
        contentStackView.addArrangedSubview(topPerformersView)
    }
    
    private func setupBindings() {
        guard let viewModel = viewModel else { return }
        
        viewModel.$isLoadingLineups
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isLoading in
                if isLoading {
                    self?.startersView.showLoading()
                } else {
                    self?.startersView.hideLoading()
                }
            }
            .store(in: &cancellables)
        
        viewModel.$homeLineup
            .combineLatest(viewModel.$awayLineup)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] homeLineup, awayLineup in
                self?.startersView.configure(homeLineup: homeLineup, awayLineup: awayLineup)
            }
            .store(in: &cancellables)
        
        viewModel.$isLoadingBoxScore
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isLoading in
                if isLoading {
                    self?.topPerformersView.showLoading()
                } else {
                    self?.topPerformersView.hideLoading()
                }
            }
            .store(in: &cancellables)
        
        viewModel.$homeTeamStats
            .combineLatest(viewModel.$awayTeamStats)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] homeStats, awayStats in
                let homePlayers = homeStats.filter { $0.didPlay }
                let awayPlayers = awayStats.filter { $0.didPlay }
                let allPlayers = homePlayers + awayPlayers
                
                let topPerformers = allPlayers
                    .sorted { $0.pts > $1.pts }
                    .prefix(3)
                
                self?.topPerformersView.configure(with: Array(topPerformers))
            }
            .store(in: &cancellables)
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
        Task {
            async let lineup: () = viewModel.loadLineups()
            async let boxScore: () = viewModel.loadBoxScore()
            
            _ = await (lineup, boxScore)
        }
    }
}
