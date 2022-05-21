//
//  DefinitionTableViewCell.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/05/05.
//

import UIKit

class DefinitionTableViewCell: UITableViewCell {
   
    
    static let reuseID = "DefinitionTableViewCell"
    
    lazy var title = UILabel()
    lazy var definitionLabel = UILabel()
    lazy var exampleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        styling()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styling() {
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 16, weight: .bold)
        title.text = "DEFINITION"
        
        definitionLabel.translatesAutoresizingMaskIntoConstraints = false
        definitionLabel.numberOfLines = 0
        definitionLabel.text = "Unfavorable; negative; not good. Unfavorable; negative; not good. Unfavorable; negative; not good. Unfavorable; negative; not good."
        definitionLabel.font = .preferredFont(forTextStyle: .subheadline)
        
        exampleLabel.translatesAutoresizingMaskIntoConstraints = false
        exampleLabel.text = "Abducting children is bad for mothers. Abducting children is bad for mothers."
        exampleLabel.numberOfLines = 0
        exampleLabel.font = .italicSystemFont(ofSize: 14)
        
    }
    
    private func layout() {
        
        contentView.addSubview(title)
        contentView.addSubview(definitionLabel)
        contentView.addSubview(exampleLabel)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            title.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            
            definitionLabel.topAnchor.constraint(equalToSystemSpacingBelow: title.bottomAnchor, multiplier: 1),
            definitionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: definitionLabel.trailingAnchor, multiplier: 1),
            
            exampleLabel.topAnchor.constraint(equalToSystemSpacingBelow: definitionLabel.bottomAnchor, multiplier: 2),
            exampleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: exampleLabel.trailingAnchor, multiplier: 1),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: exampleLabel.bottomAnchor, multiplier: 1)
            
        ])
    }
    
   
    
    
}
