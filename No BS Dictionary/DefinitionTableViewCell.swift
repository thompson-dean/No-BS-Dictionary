//
//  DefinitionTableViewCell.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/05/05.
//

import Foundation
import UIKit

class DefinitionTableViewCell: UITableViewCell {
    static let reuseID = "DefinitionTableViewCell"
    
    let partOfSpeechStackView = UIStackView()
    let partOfSpeechTitle = TitleView(frame: .zero, title: "DEFINITION", number: 5)
    let partOfSpeech = UILabel()
    
    let definitionTitleView = TitleView(frame: .zero, title: "DEFINITION", number: 5)
    let definitionLabel = UILabel()
    let openButton = UIButton()
    
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
        partOfSpeechStackView.spacing = 2
        
        partOfSpeech.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeech.font = .preferredFont(forTextStyle: .subheadline)
        partOfSpeech.text = "noun"
        
        definitionLabel.translatesAutoresizingMaskIntoConstraints = false
        definitionLabel.text = "1. A musical art form rooted in West African cultural and musical expression and in the African American blues tradition, with diverse influences over time, commonly characterized by blue notes, syncopation, swing, call and response, polyrhythms and improvisation."
        definitionLabel.numberOfLines = 0
        definitionLabel.font = .preferredFont(forTextStyle: .subheadline)
    }
    
    private func layout() {
        partOfSpeechStackView.addArrangedSubview(partOfSpeechTitle)
        partOfSpeechStackView.addArrangedSubview(partOfSpeech)
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
            definitionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 3),
            trailingAnchor.constraint(equalToSystemSpacingAfter: definitionLabel.trailingAnchor, multiplier: 3)
        ])
    }
    
    
}
