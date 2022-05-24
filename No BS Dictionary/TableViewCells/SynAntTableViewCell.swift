//
//  SynAntTableViewCell.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/05/14.
//

import Foundation

import Foundation
import UIKit

class SynAntTableViewCell: UITableViewCell {
    
    let synonymExamples = [
        "badass",
        "evil",
        "vicious",
        "vile",
        "wicked",
        "false",
        "spurious",
        "unhealthful",
        "unwholesome",
        "faulty",
        "inoperative",
        "negative",
        "unfavorable",
        "inappropriate",
        "unfit",
        "hot",
        "rubber",
        "dire",
        "severe",
        "urgent",
        "foul",
        "malodorous",
        "rotten",
        "bungling",
        "inept",
        "repulsive",
        "unsightly",
        "foul",
        "loathsome",
        "ill",
        "poorly",
        "sickly",
        "abandoned",
        "abominable",
        "base",
        "corrupt",
        "deficient",
        "detestable",
        "disgusting",
        "inferior",
        "lousy",
        "off",
        "poor",
        "punk",
        "substandard",
        "unacceptable",
        "ungodly",
        "unsatisfactory",
        "vicious",
        "wanting",
        "wretched",
        "wrong"
        ]
    
    let antonymExamples =
    [
    "adequate",
    "advantageous",
    "beneficial",
    "benevolent",
    "choice",
    "competent",
    "excellent",
    "exceptional",
    "first-class",
    "first-rate",
    "good",
    "honest",
    "just",
    "premium",
    "prime",
    "profitable",
    "propitious",
    "reputable",
    "right",
    "sincere",
    "sufficient",
    "superior",
    "true",
    "upright",
    "virtuous",
    "worthy"
    ]
    
    static let reuseID = "SynAntTableViewCell"
    
    lazy var synonymTitle = UILabel()
    lazy var antonymTitle = UILabel()
    
    let synStackView = UIStackView()
    
    lazy var synonyms = UILabel()
    lazy var antonyms = UILabel()
    
    let synonymButtons: [UIButton] = synonymExamples.map {
        let button = UIButton()
        button.setTitle($0, for: .normal)
        return button
    }
   

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        styling()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func styling() {
        synonymTitle.translatesAutoresizingMaskIntoConstraints = false
        synonymTitle.text = "SYNONYMS"
        synonymTitle.font = .systemFont(ofSize: 16, weight: .bold)
        
        antonymTitle.translatesAutoresizingMaskIntoConstraints = false
        antonymTitle.text = "ANTONYMS"
        antonymTitle.font = .systemFont(ofSize: 16, weight: .bold)
        
        synStackView.translatesAutoresizingMaskIntoConstraints = false
        synStackView.axis = .vertical
        
        synonyms.translatesAutoresizingMaskIntoConstraints = false
        synonyms.text = synonymExamples.joined(separator: "\n")
        synonyms.numberOfLines = 0
        
        antonyms.translatesAutoresizingMaskIntoConstraints = false
        antonyms.text = antonymExamples.joined(separator: "\n")
        antonyms.numberOfLines = 0
        
    }
    
    func layout() {
        
        let synonymButtons: [UIButton] = synonymExamples.map {
            let button = UIButton()
            button.setTitle($0, for: .normal)
            return button
        }
        
        contentView.addSubview(synonymTitle)
        contentView.addSubview(antonymTitle)
        
        synonymButtons.forEach { synStackView.addArrangedSubview($0) }
        contentView.addSubview(synStackView)
        contentView.addSubview(antonyms)
        
        NSLayoutConstraint.activate([
            synonymTitle.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            synonymTitle.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            
            antonymTitle.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: antonymTitle.trailingAnchor, multiplier: 6),
            
            synStackView.topAnchor.constraint(equalToSystemSpacingBelow: synonymTitle.bottomAnchor, multiplier: 2),
            synStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: synStackView.bottomAnchor, multiplier: 1),
            
            antonyms.topAnchor.constraint(equalToSystemSpacingBelow: antonymTitle.bottomAnchor, multiplier: 2),
            antonyms.leadingAnchor.constraint(equalToSystemSpacingAfter: antonymTitle.leadingAnchor, multiplier: 0)
            
        ])
    }
}
