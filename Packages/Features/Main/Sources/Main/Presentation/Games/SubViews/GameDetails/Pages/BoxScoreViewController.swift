//
//  BoxScoreViewController.swift
//  Main
//
//  Created by Bacho on 18.01.26.
//

import UIKit
import GameDomain
import Combine

class BoxScoreViewController: UIViewController {
    
    // MARK: - Properties
    weak var viewModel: GameDetailsViewModel?
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - UI Components
    
    private let boxScoreTableView: BoxScoreTableView = {
        let view = BoxScoreTableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        loadData()
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        view.backgroundColor = .clear
        view.addSubview(boxScoreTableView)
        
        NSLayoutConstraint.activate([
            boxScoreTableView.topAnchor.constraint(equalTo: view.topAnchor),
            boxScoreTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            boxScoreTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            boxScoreTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupBindings() {
        guard let viewModel = viewModel else { return }
        
        // Observe loading state
        viewModel.$isLoadingBoxScore
            .receive(on: DispatchQueue.main)
            .sink { [weak self] isLoading in
                if isLoading {
                    self?.boxScoreTableView.showLoading()
                } else {
                    self?.boxScoreTableView.hideLoading()
                }
            }
            .store(in: &cancellables)
        
        // Observe data changes
        viewModel.$homeTeamStats
            .combineLatest(viewModel.$awayTeamStats)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] homeStats, awayStats in
                print("📊 Box Score data updated - Home: \(homeStats.count), Away: \(awayStats.count)")
                self?.boxScoreTableView.configure(homeStats: homeStats, awayStats: awayStats)
            }
            .store(in: &cancellables)
    }
    
    // MARK: - Configuration
    
    func configure(with viewModel: GameDetailsViewModel) {
        self.viewModel = viewModel
        print("✅ BoxScoreViewController configured with viewModel")
    }
    
    // MARK: - Data Loading
    
    private func loadData() {
        guard let viewModel = viewModel else {
            print("❌ BoxScoreViewController: viewModel is nil!")
            return
        }
        
        print("🔄 BoxScoreViewController: Loading box score...")
        
        Task {
            await viewModel.loadBoxScore()
        }
    }
}
