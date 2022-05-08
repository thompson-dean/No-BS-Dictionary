//
//  MeaningTableViewCell.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/05/08.
//

import Foundation
import UIKit

class MeaningTableViewCell: UITableViewCell {
    
    static let reuseID = "MeaningTableViewCell"
    
    let definitionTableView = UITableView()
    
    //synonyms
    let synonymStackView = UIStackView()
    let synonymTitleLabel = UILabel()
    var synonymNumberLabel = UILabel()
    let synonymEmptyView = UIView()
    
    let synonymTableView = UITableView()
    
    //antonyms
    
    let antonymStackView = UIStackView()
    let antonymTitleLabel = UILabel()
    var antonymNumberLabel = UILabel()
    let antonymEmptyView = UIView()
    
    let antonymsTableView = UITableView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        styling()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func styling() {
        synonymStackView.translatesAutoresizingMaskIntoConstraints = false
        synonymStackView.axis = .horizontal
        synonymStackView.spacing = 6
        synonymStackView.alignment = .center
        
        synonymTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        synonymTitleLabel.text = "SYNONYM"
        synonymTitleLabel.font = .boldSystemFont(ofSize: 16)
        
        synonymNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        synonymNumberLabel.text = "6"
        synonymNumberLabel.font = .boldSystemFont(ofSize: 16)
        synonymNumberLabel.textColor = .darkGray
        
        synonymEmptyView.translatesAutoresizingMaskIntoConstraints = false

        synonymTableView.translatesAutoresizingMaskIntoConstraints = false
        synonymTableView.tag = 0
        synonymTableView.delegate = self
        synonymTableView.dataSource = self
        synonymTableView.rowHeight = 23
        synonymTableView.register(UITableViewCell.self, forCellReuseIdentifier: "synonymCell")
        synonymTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        antonymStackView.translatesAutoresizingMaskIntoConstraints = false
        antonymStackView.axis = .horizontal
        antonymStackView.spacing = 6
        antonymStackView.alignment = .center
        
        antonymTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        antonymTitleLabel.text = "ANTONYM"
        antonymTitleLabel.font = .boldSystemFont(ofSize: 16)
        
        antonymNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        antonymNumberLabel.text = "6"
        antonymNumberLabel.font = .boldSystemFont(ofSize: 16)
        antonymNumberLabel.textColor = .darkGray
        
        antonymEmptyView.translatesAutoresizingMaskIntoConstraints = false
        
        antonymsTableView.translatesAutoresizingMaskIntoConstraints = false
        antonymsTableView.tag = 1
        antonymsTableView.delegate = self
        antonymsTableView.dataSource = self
        antonymsTableView.rowHeight = 23
        antonymsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "antonymCell")
        antonymsTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    private func layout() {
        
        contentView.addSubview(definitionTableView)
        
        synonymStackView.addArrangedSubview(synonymTitleLabel)
        synonymStackView.addArrangedSubview(synonymNumberLabel)
        synonymStackView.addArrangedSubview(synonymEmptyView)
        contentView.addSubview(synonymStackView)
        contentView.addSubview(synonymTableView)
        
        antonymStackView.addArrangedSubview(antonymTitleLabel)
        antonymStackView.addArrangedSubview(antonymNumberLabel)
        antonymStackView.addArrangedSubview(antonymEmptyView)
        contentView.addSubview(antonymStackView)
        contentView.addSubview(antonymsTableView)
    }
}

extension MeaningTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 0 {
            
            synonymTableView.deselectRow(at: indexPath, animated: true)
        } else if tableView.tag == 1 {

            antonymsTableView.deselectRow(at: indexPath, animated: true)
        } else {
            
            definitionTableView.deselectRow(at: indexPath, animated: false)
        }
    }
}

extension MeaningTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return 2
        } else if tableView.tag == 1 {
            return 2
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "synonymCell", for: indexPath)
            cell.textLabel?.font = .preferredFont(forTextStyle: .subheadline)
            cell.textLabel?.text = "Test"
            return cell
            
            
        } else if tableView.tag == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "antonymCell", for: indexPath)
            cell.textLabel?.font = .preferredFont(forTextStyle: .subheadline)
            cell.textLabel?.text = "Test"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: DefinitionTableViewCell.reuseID, for: indexPath) as! DefinitionTableViewCell
            
            return cell
        }
        
    }
    
    
}
