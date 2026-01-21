//
//  BoxScoreTableView.swift
//  Main
//
//  Created by Bacho on 18.01.26.
//

import UIKit
import GameDomain

final class BoxScoreTableViewController: UIView {
    
    // MARK: - Properties
    var homeStats: [PlayerStats] = []
    var awayStats: [PlayerStats] = []
    var homeTeamName: String = "Home"
    var awayTeamName: String = "Away"
    
    // MARK: - UI Components
    
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Home", "Away"])
        sc.selectedSegmentIndex = 0
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    let tableContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    let emptyLabel: UILabel = {
        let label = UILabel()
        label.text = "Box score is not available yet"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .gray
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupUI() {
        backgroundColor = .clear
        
        addSubview(segmentedControl)
        addSubview(scrollView)
        scrollView.addSubview(tableContainer)
        addSubview(loadingIndicator)
        addSubview(emptyLabel)
        
        segmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
        
        NSLayoutConstraint.activate([
            segmentedControl.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            segmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            segmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            scrollView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tableContainer.topAnchor.constraint(equalTo: scrollView.topAnchor),
            tableContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            tableContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            tableContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            tableContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            emptyLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emptyLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func showLoading() {
        loadingIndicator.startAnimating()
        scrollView.isHidden = true
        emptyLabel.isHidden = true
        segmentedControl.isHidden = true
    }
    
    func hideLoading() {
        loadingIndicator.stopAnimating()
    }    
}
