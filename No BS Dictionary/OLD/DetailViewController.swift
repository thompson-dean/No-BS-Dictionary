//
//  DetailViewController.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/03/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    var wordLabel = UILabel()
//    var description = UILabel()
    var stackView = UIStackView()
    
//    let word: String
    
//    init(word: String) {
//        self.word = word
//
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        style()
        layout()
    }
    
    private func style() {
        wordLabel.translatesAutoresizingMaskIntoConstraints = false
        wordLabel.text = "word"
        
//        description.translatesAutoresizingMaskIntoConstraints = false
//        description.text = "Welcome to detail screen brah"
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
    }
    
    private func layout() {
        stackView.addArrangedSubview(wordLabel)
//        stackView.addArrangedSubview(description)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
