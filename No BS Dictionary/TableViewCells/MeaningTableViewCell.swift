//
//  MeaningTableViewCell.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/05/08.
//

import UIKit

class MeaningTableViewCell: UITableViewCell {
    
    
    var synonyms = [String]()
    var antonyms = [String]()
    
    var definitions = [Definition]()
    
    static let reuseID = "MeaningTableViewCell"
    
    //Add part Of Speech Labels etc.
    
    let partOfSpeechTitle = UILabel()
    var partOfSpeechLabel = UILabel()
    
    let definitionStackView = UIStackView()
    let definitionsLabel = UILabel()
    var definitionsNumber = UILabel()
    let definitionEmptyView = UIView()
    
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
        
        
        partOfSpeechTitle.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeechTitle.text = "PART OF SPEECH"
        partOfSpeechTitle.font = .boldSystemFont(ofSize: 16)
        partOfSpeechLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        definitionStackView.translatesAutoresizingMaskIntoConstraints = false
        definitionStackView.axis = .horizontal
        definitionStackView.spacing = 6
        definitionStackView.alignment = .center
        
        definitionsLabel.translatesAutoresizingMaskIntoConstraints = false
        definitionsLabel.text = "DEFINITIONS"
        definitionsLabel.font = .boldSystemFont(ofSize: 16)
        
        definitionsNumber.translatesAutoresizingMaskIntoConstraints = false
        definitionsNumber.font = .boldSystemFont(ofSize: 16)
        definitionsNumber.text = "0"
        definitionsNumber.textColor = .darkGray
        
        definitionTableView.translatesAutoresizingMaskIntoConstraints = false
        definitionTableView.tag = 2
        definitionTableView.delegate = self
        definitionTableView.dataSource = self
        definitionTableView.register(DefinitionTableViewCell.self, forCellReuseIdentifier: DefinitionTableViewCell.reuseID)
        definitionTableView.isScrollEnabled = false
        definitionTableView.rowHeight = 125
//        definitionTableView.rowHeight = UITableView.automaticDimension
        
        synonymStackView.translatesAutoresizingMaskIntoConstraints = false
        synonymStackView.axis = .horizontal
        synonymStackView.spacing = 6
        synonymStackView.alignment = .center
        
        synonymTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        synonymTitleLabel.text = "SYNONYM"
        synonymTitleLabel.font = .boldSystemFont(ofSize: 16)
        
        synonymNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        synonymNumberLabel.font = .boldSystemFont(ofSize: 16)
        synonymNumberLabel.text = "0"
        synonymNumberLabel.textColor = .darkGray
        
        synonymEmptyView.translatesAutoresizingMaskIntoConstraints = false

        synonymTableView.translatesAutoresizingMaskIntoConstraints = false
        synonymTableView.tag = 0
        synonymTableView.delegate = self
        synonymTableView.dataSource = self
        synonymTableView.rowHeight = 23
        synonymTableView.register(UITableViewCell.self, forCellReuseIdentifier: "synonymCell")
        synonymTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        synonymTableView.isScrollEnabled = false
        
        antonymStackView.translatesAutoresizingMaskIntoConstraints = false
        antonymStackView.axis = .horizontal
        antonymStackView.spacing = 6
        antonymStackView.alignment = .center
        
        antonymTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        antonymTitleLabel.text = "ANTONYM"
        antonymTitleLabel.font = .boldSystemFont(ofSize: 16)
        
        antonymNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        antonymNumberLabel.font = .boldSystemFont(ofSize: 16)
        antonymNumberLabel.textColor = .darkGray
        antonymNumberLabel.text = "0"
        
        antonymEmptyView.translatesAutoresizingMaskIntoConstraints = false
        
        antonymsTableView.translatesAutoresizingMaskIntoConstraints = false
        antonymsTableView.tag = 1
        antonymsTableView.delegate = self
        antonymsTableView.dataSource = self
        antonymsTableView.rowHeight = 23
        antonymsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "antonymCell")
        antonymsTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        antonymsTableView.isScrollEnabled = false
    }
    
    private func layout() {
        
        // Part of Speech added
        contentView.addSubview(partOfSpeechTitle)
        contentView.addSubview(partOfSpeechLabel)
        
        // Definiton Title Stack View Added
        definitionStackView.addArrangedSubview(definitionsLabel)
        definitionStackView.addArrangedSubview(definitionsNumber)
        definitionStackView.addArrangedSubview(definitionEmptyView)
        contentView.addSubview(definitionStackView)

        //Defintions TableView Added
        contentView.addSubview(definitionTableView)

        //synonyms title and tableview
        synonymStackView.addArrangedSubview(synonymTitleLabel)
        synonymStackView.addArrangedSubview(synonymNumberLabel)
        synonymStackView.addArrangedSubview(synonymEmptyView)
        contentView.addSubview(synonymStackView)

        contentView.addSubview(synonymTableView)

        //Antonyms title and tableview
        antonymStackView.addArrangedSubview(antonymTitleLabel)
        antonymStackView.addArrangedSubview(antonymNumberLabel)
        antonymStackView.addArrangedSubview(antonymEmptyView)
        contentView.addSubview(antonymStackView)

        contentView.addSubview(antonymsTableView)
        
        
        NSLayoutConstraint.activate([
            partOfSpeechTitle.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            partOfSpeechTitle.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            
            partOfSpeechLabel.topAnchor.constraint(equalToSystemSpacingBelow: partOfSpeechTitle.bottomAnchor, multiplier: 0),
            partOfSpeechLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            
            definitionStackView.topAnchor.constraint(equalToSystemSpacingBelow: partOfSpeechLabel.bottomAnchor, multiplier: 3),
            definitionStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: definitionStackView.trailingAnchor, multiplier: 1),
            
            definitionTableView.topAnchor.constraint(equalToSystemSpacingBelow: definitionStackView.bottomAnchor, multiplier: 1),
            definitionTableView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: definitionTableView.trailingAnchor, multiplier: 1),
            definitionTableView.heightAnchor.constraint(equalToConstant: 375),
            
            synonymStackView.topAnchor.constraint(equalToSystemSpacingBelow: definitionTableView.bottomAnchor, multiplier: 2),
            synonymStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            synonymStackView.widthAnchor.constraint(equalToConstant: 180),
            
            synonymTableView.topAnchor.constraint(equalToSystemSpacingBelow: synonymStackView.bottomAnchor, multiplier: 1),
            synonymTableView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 0),
            synonymTableView.widthAnchor.constraint(equalToConstant: 180),
            bottomAnchor.constraint(equalToSystemSpacingBelow: synonymTableView.bottomAnchor, multiplier: 1),
            
            antonymStackView.topAnchor.constraint(equalToSystemSpacingBelow: definitionTableView.bottomAnchor, multiplier: 2),
            antonymStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: synonymStackView.trailingAnchor, multiplier: 3),
            antonymStackView.widthAnchor.constraint(equalToConstant: 180),
            
            antonymsTableView.topAnchor.constraint(equalToSystemSpacingBelow: antonymStackView.bottomAnchor, multiplier: 1),
            antonymsTableView.leadingAnchor.constraint(equalToSystemSpacingAfter: synonymTableView.trailingAnchor, multiplier: 3),
            antonymsTableView.widthAnchor.constraint(equalToConstant: 180),
            bottomAnchor.constraint(equalToSystemSpacingBelow: antonymsTableView.bottomAnchor, multiplier: 1)
            
            
        ])
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
            return synonyms.count
        } else if tableView.tag == 1 {
            return antonyms.count
        } else {
            return definitions.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "synonymCell", for: indexPath)
            cell.textLabel?.font = .preferredFont(forTextStyle: .subheadline)
            cell.textLabel?.text = synonyms[indexPath.row]
            return cell
            
        } else if tableView.tag == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "antonymCell", for: indexPath)
            cell.textLabel?.font = .preferredFont(forTextStyle: .subheadline)
            cell.textLabel?.text = antonyms[indexPath.row]
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: DefinitionTableViewCell.reuseID, for: indexPath) as! DefinitionTableViewCell
            
            cell.definitionLabel.text = definitions[indexPath.row].definition
            cell.exampleLabel.text = definitions[indexPath.row].example
            
            cell.setNeedsUpdateConstraints()
            cell.updateConstraintsIfNeeded()
            return cell
        }
        
    }
}

//extension MeaningTableViewCell {
//    func configure(vm: ViewModel) {
//        partOfSpeechLabel.text = vm.partOfSpeech
//        definitionsNumber.text = vm.definitionNumber
//        synonymNumberLabel.text = vm.synonymsNumber
//        synonyms = vm.synonyms
//        antonymNumberLabel.text = vm.antonymsNumber
//        antonyms = vm.antonyms
//
//    }
//}
