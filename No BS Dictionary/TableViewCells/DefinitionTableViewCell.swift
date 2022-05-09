//
//  DefinitionTableViewCell.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/05/05.
//

import UIKit

class DefinitionTableViewCell: UITableViewCell {
    
    struct ViewModel {
        let definition: String
        let example: String
    }
    
    static let reuseID = "DefinitionTableViewCell"
    
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
        
        
        contentView.addSubview(definitionLabel)
        contentView.addSubview(exampleLabel)
        
        NSLayoutConstraint.activate([
            definitionLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            definitionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: definitionLabel.trailingAnchor, multiplier: 1),
            
            exampleLabel.topAnchor.constraint(equalToSystemSpacingBelow: definitionLabel.bottomAnchor, multiplier: 2),
            exampleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: exampleLabel.trailingAnchor, multiplier: 1)
            
        ])
    }
    
    func configure(viewModel: ViewModel) {
        
    }
    
    
}
