//
//  PartOfSpeechTableViewCell.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/05/25.
//

import Foundation
import UIKit


class PartOfSpeechTableViewCell: UITableViewCell {
    
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
            "foul"
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
    
    static let reuseID = "PartOfSpeechTableViewCell"
    
    let mainStackView = UIStackView()
    
    let partOfSpeechlabel = UILabel()
    let partOfSpeechType = UILabel()
    
    let definitionStackView = UIStackView()
    let definitionTitle = UILabel()
    let definition = UILabel()
    let example = UILabel()
    
    let synAntHorizontalStackView = UIStackView()
    
    let synTitle = UILabel()
    let synStackView = UIStackView()
    
    let antTitle = UILabel()
    let antStackView = UIStackView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        styling()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func styling() {
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.axis = .vertical
        mainStackView.spacing = 8
        
        partOfSpeechlabel.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeechlabel.text = "PART OF SPEECH"
        partOfSpeechlabel.font = .systemFont(ofSize: 16, weight: .bold)
        
        partOfSpeechType.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeechType.text = "noun"
        
        definitionStackView.translatesAutoresizingMaskIntoConstraints = false
        definitionStackView.axis =  .vertical
        definitionStackView.spacing = 8
        
        definitionTitle.translatesAutoresizingMaskIntoConstraints = false
        definitionTitle.text = "DEFINITION"
        definitionTitle.font = .systemFont(ofSize: 16, weight: .bold)
        
        definition.translatesAutoresizingMaskIntoConstraints = false
        definition.numberOfLines = 0
        definition.text = "Unfavorable; negative; not good. Unfavorable; negative; not good. Unfavorable; negative; not good. Unfavorable; negative; not good."
        definition.font = .preferredFont(forTextStyle: .subheadline)
        
        example.translatesAutoresizingMaskIntoConstraints = false
        example.text = "Abducting children is bad for mothers. Abducting children is bad for mothers."
        example.numberOfLines = 0
        example.font = .italicSystemFont(ofSize: 14)
        
        synAntHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        synAntHorizontalStackView.axis = .horizontal
        synAntHorizontalStackView.spacing = 16
        
        synTitle.translatesAutoresizingMaskIntoConstraints = false
        synTitle.text = "SYNONYMS"
        synTitle.font = .systemFont(ofSize: 16, weight: .bold)
        
        
        antTitle.translatesAutoresizingMaskIntoConstraints = false
        antTitle.text = "SYNONYMS"
        antTitle.font = .systemFont(ofSize: 16, weight: .bold)
        
        
        
        
        
    }
    
    func layout() {
        
        
        
        mainStackView.addArrangedSubview(partOfSpeechlabel)
        mainStackView.addArrangedSubview(partOfSpeechType)
        mainStackView.addArrangedSubview(definitionTitle)
        
        definitionStackView.addArrangedSubview(definition)
        definitionStackView.addArrangedSubview(example)
        
        mainStackView.addArrangedSubview(definitionStackView)
        
        
        
        synAntHorizontalStackView.addArrangedSubview(synStackView)
        
        
        synAntHorizontalStackView.addArrangedSubview(antStackView)
        
        mainStackView.addArrangedSubview(synAntHorizontalStackView)

        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            
        ])
    }
}
