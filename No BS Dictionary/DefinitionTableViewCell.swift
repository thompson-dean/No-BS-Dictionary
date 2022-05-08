//
//  DefinitionTableViewCell.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/05/05.
//

import Foundation
import UIKit

class DefinitionTableViewCell: UITableViewCell {
    
    struct ViewModel {
        let partOfSpeech: String
        let definition: String
    }
    
    static let reuseID = "DefinitionTableViewCell"
    
    lazy var partOfSpeechStackView = UIStackView()
    lazy var partOfSpeechTitle = TitleView(frame: .zero, title: "PART OF SPEECH")
    lazy var partOfSpeechLabel = UILabel()
    
    lazy var definitionTitleView = TitleView(frame: .zero, title: "DEFINITION")
    lazy var definitionLabel = UILabel()
    lazy var openButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        styling()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styling() {
        partOfSpeechStackView.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeechStackView.axis = .vertical
        partOfSpeechStackView.spacing = 8
        
        partOfSpeechLabel.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeechLabel.font = .preferredFont(forTextStyle: .subheadline)
        
        definitionLabel.translatesAutoresizingMaskIntoConstraints = false
        definitionLabel.numberOfLines = 0
        definitionLabel.font = .preferredFont(forTextStyle: .subheadline)
    }
    
    private func layout() {
        partOfSpeechStackView.addArrangedSubview(partOfSpeechTitle)
        partOfSpeechStackView.addArrangedSubview(partOfSpeechLabel)
        contentView.addSubview(partOfSpeechStackView)
        contentView.addSubview(definitionTitleView)
        contentView.addSubview(definitionLabel)
        
        NSLayoutConstraint.activate([
            partOfSpeechStackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            partOfSpeechStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: partOfSpeechStackView.trailingAnchor, multiplier: 2),
            
            definitionTitleView.topAnchor.constraint(equalToSystemSpacingBelow: partOfSpeechStackView.bottomAnchor, multiplier: 3),
            definitionTitleView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: definitionTitleView.trailingAnchor, multiplier: 2),
            
            definitionLabel.topAnchor.constraint(equalToSystemSpacingBelow: definitionTitleView.bottomAnchor, multiplier: 1),
            definitionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: definitionLabel.trailingAnchor, multiplier: 2)
        ])
    }
    
    func configure(partOfSpeech: String, definition: String) {
        partOfSpeechLabel.text = partOfSpeech
        definitionLabel.text = definition
    }
    
    
}
