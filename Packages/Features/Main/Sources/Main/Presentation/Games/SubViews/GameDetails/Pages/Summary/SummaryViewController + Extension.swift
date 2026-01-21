//
//  SummaryViewController + Extension.swift
//  Main
//
//  Created by Bacho on 22.01.26.
//

import UIKit

extension SummaryViewController {
    func setupUI() {
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
    
    func setupBindings() {
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
}
