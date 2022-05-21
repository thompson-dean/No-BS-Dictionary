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
    
    static let reuseID = "SynAntTableViewCell"
    
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
        title.font = .systemFont(ofSize: 14, weight: .bold)
        
        partOfSpeech.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeech.text = "jazz"
        partOfSpeech.numberOfLines = 0
        
    }
    
    func layout() {
        contentView.addSubview(title)
        contentView.addSubview(partOfSpeech)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            title.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            
            partOfSpeech.topAnchor.constraint(equalToSystemSpacingBelow: title.bottomAnchor, multiplier: 2),
            partOfSpeech.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: partOfSpeech.bottomAnchor, multiplier: 1)
            
        ])
    }
}
