//  GameDetailsViewController.swift
//  Swish
//
//  Created by Bacho on 10.01.26.
//

import UIKit
import Common
import Helpers

final class GameDetailsViewController: UIViewController {
    
    private let viewModel: GameDetailsViewModel
    private var currentPageViewController: UIViewController?
    
    // MARK: - UI Components
    
    private let customNavigationBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "chevron.left.chevron.left.dotted"), for: .normal)
        button.tintColor = .label
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let gameScoreHeaderView: GameScoreHeaderView = {
        let view = GameScoreHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
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
    
    private let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Summary", "Box Score"])
        sc.selectedSegmentIndex = 0
        sc.setTitleTextAttributes([.foregroundColor: UIColor.label], for: .selected)
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    private let pageContainerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initialization
    init(viewModel: GameDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addSwiftUIBackground(PosterBackground(poster: "poster2"))
        setupCustomNavigationBar()
        setupUI()
        configureViews()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupCustomNavigationBar() {
        view.addSubview(customNavigationBar)
        customNavigationBar.addSubview(backButton)
        customNavigationBar.addSubview(gameScoreHeaderView)
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            customNavigationBar.topAnchor.constraint(equalTo: view.topAnchor),
            customNavigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            customNavigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            customNavigationBar.heightAnchor.constraint(equalToConstant: 120),
            
            backButton.leadingAnchor.constraint(equalTo: customNavigationBar.leadingAnchor, constant: 16),
            backButton.centerYAnchor.constraint(equalTo: customNavigationBar.centerYAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 44),
            backButton.heightAnchor.constraint(equalToConstant: 44),
            
            gameScoreHeaderView.centerXAnchor.constraint(equalTo: customNavigationBar.centerXAnchor),
            gameScoreHeaderView.centerYAnchor.constraint(equalTo: customNavigationBar.centerYAnchor, constant: 20),
            gameScoreHeaderView.leadingAnchor.constraint(greaterThanOrEqualTo: backButton.trailingAnchor, constant: 8),
            gameScoreHeaderView.trailingAnchor.constraint(lessThanOrEqualTo: customNavigationBar.trailingAnchor, constant: -16),
            gameScoreHeaderView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(contentStackView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20),
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
        ])
        
        contentStackView.addArrangedSubview(segmentedControl)
        contentStackView.addArrangedSubview(pageContainerView)
        
        segmentedControl.addTarget(self, action: #selector(didChangeSegment), for: .valueChanged)
        
        displayPage(index: 0)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    private func configureViews() {
        gameScoreHeaderView.configure(with: viewModel.currentGame)
    }
    
    @objc private func didChangeSegment(_ sender: UISegmentedControl) {
        displayPage(index: sender.selectedSegmentIndex)
    }
    
    private func displayPage(index: Int) {
        if let currentVC = currentPageViewController {
            currentVC.willMove(toParent: nil)
            currentVC.view.removeFromSuperview()
            currentVC.removeFromParent()
        }
        
        let newVC: UIViewController
        if index == 0 {
            let summaryVC = SummaryViewController()
            summaryVC.configure(with: viewModel.currentGame)
            newVC = summaryVC
        } else {
            newVC = BoxScoreViewController()
            
        }
        
        addChild(newVC)
        pageContainerView.addSubview(newVC.view)
        newVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newVC.view.topAnchor.constraint(equalTo: pageContainerView.topAnchor),
            newVC.view.leadingAnchor.constraint(equalTo: pageContainerView.leadingAnchor),
            newVC.view.trailingAnchor.constraint(equalTo: pageContainerView.trailingAnchor),
            newVC.view.bottomAnchor.constraint(equalTo: pageContainerView.bottomAnchor)
        ])
        
        newVC.didMove(toParent: self)
        currentPageViewController = newVC
    }
}
