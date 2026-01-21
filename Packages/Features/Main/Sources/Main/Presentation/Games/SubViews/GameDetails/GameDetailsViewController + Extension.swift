//
//  GameDetailsViewController + Extension.swift
//  Main
//
//  Created by Bacho on 21.01.26.
//

import UIKit

extension GameDetailsViewController {
    func setupCustomNavigationBar() {
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
    
    func setupUI() {
        view.backgroundColor = .clear
        view.addSubview(segmentedControl)
        view.addSubview(pageContainerView)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor, constant: 16),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            pageContainerView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            pageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            pageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            pageContainerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
        segmentedControl.addTarget(self, action: #selector(didChangeSegment), for: .valueChanged)
        
        displayPage(index: 0)
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func configureViews() {
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
            summaryVC.configure(with: viewModel.currentGame, viewModel: viewModel)
            newVC = summaryVC
        } else {
            let boxScoreVC = BoxScoreViewController()
            boxScoreVC.configure(with: viewModel)
            newVC = boxScoreVC
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
