//
//  WordViewController.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/05/05.
//

import UIKit

class WordViewController: UIViewController {
    
    
    var chosenWord = ""
    
    var meanings = [Meaning]()
    
    var searchWords = [WordUnit]()

    
    // Word Title
    let word = UILabel()
    
    //Phonetics
    let phoneticsStackView = UIStackView()
    let phoneticsButton = UIButton()
    let speakerImage = UIImageView()
    let emptyView = UIView()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = .systemBackground
        
        style()
        layout()
        fetchDataandLoadView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchDataandLoadView()
    }
}

extension WordViewController {
    
    
    private func style() {
        
        word.translatesAutoresizingMaskIntoConstraints = false
        word.font = UIFont(name: "Charter-Black", size: 40)
        
        phoneticsStackView.translatesAutoresizingMaskIntoConstraints = false
        phoneticsStackView.axis = .horizontal
        phoneticsStackView.spacing = 4
        
        phoneticsButton.translatesAutoresizingMaskIntoConstraints = false
        phoneticsButton.setTitleColor(.systemBlue, for: [])
        phoneticsButton.addTarget(self, action: #selector(playPhonetics), for: .touchUpInside)
        
        speakerImage.translatesAutoresizingMaskIntoConstraints = false
        speakerImage.image = UIImage(systemName: "speaker.wave.3.fill")
        speakerImage.contentMode = .scaleAspectFit
        
        // using this view as a spacer of the stackview
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        //Register TableViewCell
        
        tableView.register(PartOfSpeechTableViewCell.self, forCellReuseIdentifier: PartOfSpeechTableViewCell.reuseID)
        
        //TableView Details
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 80
        tableView.rowHeight = UITableView.automaticDimension
    
    
    }
    
    private func layout() {
        view.addSubview(word)

        phoneticsStackView.addArrangedSubview(phoneticsButton)
        phoneticsStackView.addArrangedSubview(speakerImage)
        phoneticsStackView.addArrangedSubview(emptyView)
        view.addSubview(phoneticsStackView)
        
        view.addSubview(tableView)
    
        NSLayoutConstraint.activate([
            word.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 12),
            word.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            
            phoneticsStackView.topAnchor.constraint(equalToSystemSpacingBelow: word.bottomAnchor, multiplier: 0),
            phoneticsStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: phoneticsStackView.trailingAnchor, multiplier: 2),
            
            tableView.topAnchor.constraint(equalToSystemSpacingBelow: phoneticsStackView.bottomAnchor, multiplier: 1),
            tableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: tableView.trailingAnchor, multiplier: 2),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: tableView.bottomAnchor, multiplier: 1)
            
        ])
    }
    
    @objc func playPhonetics(_ sender: UIButton) {
        // Add text to voice here
    }
}

//MARK: - TABLE VIEW DELEGATE

extension WordViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}

//MARK: - TABLEVIEW DATA SOURCE
extension WordViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meanings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PartOfSpeechTableViewCell.reuseID, for: indexPath) as! PartOfSpeechTableViewCell
        
        cell.partOfSpeechType.text = meanings[indexPath.row].partOfSpeech
        
        let definitions: [UILabel] = meanings[indexPath.row].definitions.map {
            let label = UILabel()
            label.text = "・\($0.definition)"
            label.numberOfLines = 0
            return label
        }
        
        definitions.forEach {
            cell.definitionStackView.addArrangedSubview($0)
        }
        
        let synonymButtons: [UIButton] = meanings[indexPath.row].synonyms.map {
            let button = UIButton()
            button.setTitle($0, for: .normal)
            button.setTitleColor(.link, for: .normal)
            return button
        }
        
        let antonymButtons: [UIButton] = meanings[indexPath.row].antonyms.map {
            let button = UIButton()
            button.setTitle($0, for: .normal)
            button.setTitleColor(.link, for: .normal)
            return button
        }
        
        synonymButtons.forEach {
            cell.synStackView.addArrangedSubview($0)
        }
        
        antonymButtons.forEach {
            cell.antStackView.addArrangedSubview($0)
        }
        
        return cell
        
    }
    
}

//MARK: - CONFIGURE VIEW

extension WordViewController {
    private func fetchDataandLoadView() {
        fetchWordUnits(forWord: chosenWord) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let wordUnits):
                    
                    self.searchWords = wordUnits
                    self.word.text = self.searchWords[0].word
                    self.meanings = wordUnits[0].meanings
                    self.phoneticsButton.setTitle(self.searchWords[0].phonetics[0].text ?? "    ", for: .normal)
                    self.tableView.reloadData()
                    
//                    let phoneticLabels: [UILabel] = wordUnits[0].phonetics.map {
//                        let label = UILabel()
//                        label.text = $0.text ?? ""
//                        return label
//                    }
//
//                    phoneticLabels.forEach {
//                        self.phoneticsStackView.addArrangedSubview($0)
//                    }
                    
                
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        }
    }

}


extension WordViewController {
    func attributedText(withString string: String, boldString: String) -> NSAttributedString {
        let boldAttribute = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)
        ]
        let regularAttribute = [
            NSAttributedString.Key.font: UIFont.systemFontSize
        ]
        let boldText = NSAttributedString(string: boldString, attributes: boldAttribute)
        let regularText = NSAttributedString(string: string, attributes: regularAttribute)
        let newString = NSMutableAttributedString()
        newString.append(boldText)
        newString.append(regularText)
        return newString
    }
}

