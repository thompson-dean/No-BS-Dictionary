//
//  DetailViewController.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/03/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var wordLabel = UILabel()
    
    let word: String
    
    init(word: String) {
        self.word = word
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        style()
        layout()
    }
    
    private func style() {
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        wordLabel.text = word
    }
    
    private func layout() {
        view.addSubview(wordLabel)
        
        NSLayoutConstraint.activate([
            wordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            wordLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
