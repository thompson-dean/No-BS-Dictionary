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
    
    func styling() {
        
    }
    
    func layout() {
        
    }
}
