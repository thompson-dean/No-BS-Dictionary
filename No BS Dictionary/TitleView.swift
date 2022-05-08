//
//  TitleView.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/05/05.
//

import UIKit

class TitleView: UIView {
    
    let title: String
//    let number: Int
    
    let stackView = UIStackView()
    let titleLabel = UILabel()
//    let numberLabel = UILabel()
    let emptyView = UIView()
    
    init(frame: CGRect, title: String) {
        
        self.title = title
//        self.number = number
        
        super.init(frame: frame)
  
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension TitleView {
    
    private func style() {
        translatesAutoresizingMaskIntoConstraints = false
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.font = .boldSystemFont(ofSize: 16)
        
        
//        numberLabel.translatesAutoresizingMaskIntoConstraints = false
//        numberLabel.text = "\(number)"
//        numberLabel.font = .boldSystemFont(ofSize: 16)
//        numberLabel.textColor = .darkGray
        
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func layout() {
        stackView.addArrangedSubview(titleLabel)
//        stackView.addArrangedSubview(numberLabel)
        stackView.addArrangedSubview(emptyView)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
            
            
        ])

    }
}
