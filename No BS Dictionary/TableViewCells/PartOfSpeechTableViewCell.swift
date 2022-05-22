//
//  partOfSpeechTableViewCell.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/05/14.
//

import Foundation
import UIKit

class PartOfSpeechTableViewCell: UITableViewCell {
    
    static let reuseID = "PartOfSpeechTableViewCell"
    
    lazy var title = UILabel()
    lazy var partOfSpeech = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        styling()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func styling() {
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "PART OF SPEECH"
        title.font = .systemFont(ofSize: 16, weight: .bold)
        
        partOfSpeech.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeech.numberOfLines = 0
        partOfSpeech.text = "noun"
        
    }
    
    func layout() {
        contentView.addSubview(title)
        contentView.addSubview(partOfSpeech)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            title.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            
            
            partOfSpeech.topAnchor.constraint(equalToSystemSpacingBelow: title.bottomAnchor, multiplier:   1),
            partOfSpeech.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: partOfSpeech.bottomAnchor, multiplier: 1)
        ])
    }
}
