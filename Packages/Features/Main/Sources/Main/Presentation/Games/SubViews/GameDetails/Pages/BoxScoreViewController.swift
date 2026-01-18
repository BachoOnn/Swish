//
//  BoxScoreViewController.swift
//  Main
//
//  Created by Bacho on 18.01.26.
//

import UIKit

import UIKit

class BoxScoreViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Box Score Content Coming Soon"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            view.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
}
