//
//  PartOfSpeechTableViewCell.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/05/25.
//

import Foundation
import UIKit


class PartOfSpeechTableViewCell: UITableViewCell {
    
    static let reuseID = "PartOfSpeechTableViewCell"
    
    let mainStackView = UIStackView()
    
    let partOfSpeechlabel = UILabel()
    let partOfSpeechType = UILabel()
    
    let definitionStackView = UIStackView()
    let definitionTitle = UILabel()
    let definition = UILabel()
    let example = UILabel()
    
    let synAntHorizontalStackView = UIStackView()
    
    let synAntTitleStackView = UIStackView()
    
    let synTitle = UILabel()
    let synStackView = UIStackView()
    
    let antTitle = UILabel()
    let antStackView = UIStackView()
    
    let emptyView = UIView()
    let emptyView1 = UIView()
    let emptyView2 = UIView()
    let emptyView3 = UIView()
    
    
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
        partOfSpeechlabel.font = .systemFont(ofSize: 18, weight: .bold)
        
        partOfSpeechType.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeechType.text = "noun"
        
        definitionStackView.translatesAutoresizingMaskIntoConstraints = false
        definitionStackView.axis =  .vertical
        definitionStackView.spacing = 12
        
        definitionTitle.translatesAutoresizingMaskIntoConstraints = false
        definitionTitle.text = "DEFINITIONS"
        definitionTitle.font = .systemFont(ofSize: 18, weight: .bold)
        
        definition.translatesAutoresizingMaskIntoConstraints = false
        definition.numberOfLines = 0
        definition.text = ""
        definition.font = .preferredFont(forTextStyle: .subheadline)
        
        example.translatesAutoresizingMaskIntoConstraints = false
        example.text = ""
        example.numberOfLines = 0
        example.font = .italicSystemFont(ofSize: 14)
        
        synAntHorizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        synAntHorizontalStackView.axis = .horizontal
        synAntHorizontalStackView.spacing = 16
        synAntHorizontalStackView.alignment = .top
        
        synAntTitleStackView.translatesAutoresizingMaskIntoConstraints = false
        synAntTitleStackView.axis = .horizontal
        synAntTitleStackView.spacing = 16
        
        synTitle.translatesAutoresizingMaskIntoConstraints = false
        synTitle.text = "SYNONYMS"
        synTitle.font = .systemFont(ofSize: 18, weight: .bold)
        
        synStackView.translatesAutoresizingMaskIntoConstraints = false
        synStackView.axis = .vertical
        synStackView.alignment = .leading
        synStackView.spacing = -8
        
        antTitle.translatesAutoresizingMaskIntoConstraints = false
        antTitle.text = "ANTONYMS"
        antTitle.font = .systemFont(ofSize: 18, weight: .bold)
        
        antStackView.translatesAutoresizingMaskIntoConstraints = false
        antStackView.axis = .vertical
        antStackView.alignment = .leading
        antStackView.spacing = -8
        
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        emptyView1.translatesAutoresizingMaskIntoConstraints = false
        emptyView2.translatesAutoresizingMaskIntoConstraints = false
        emptyView3.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func layout() {
        
        mainStackView.addArrangedSubview(partOfSpeechlabel)
        mainStackView.addArrangedSubview(partOfSpeechType)
        mainStackView.addArrangedSubview(definitionTitle)

        
        mainStackView.addArrangedSubview(definitionStackView)
        
        synAntTitleStackView.addArrangedSubview(synTitle)
        synAntTitleStackView.addArrangedSubview(emptyView2)
        synAntTitleStackView.addArrangedSubview(antTitle)
        synAntTitleStackView.addArrangedSubview(emptyView3)
        mainStackView.addArrangedSubview(synAntTitleStackView)
        
        synAntHorizontalStackView.addArrangedSubview(synStackView)
        
    
        synAntHorizontalStackView.addArrangedSubview(emptyView)
        synAntHorizontalStackView.addArrangedSubview(antStackView)
        synAntHorizontalStackView.addArrangedSubview(emptyView1)
        
        mainStackView.addArrangedSubview(synAntHorizontalStackView)

        contentView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            mainStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
            
        ])
        
        
        emptyView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        emptyView2.widthAnchor.constraint(equalToConstant: 76).isActive = true
    }
}
