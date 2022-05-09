//
//  WordViewController.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/05/05.
//

import UIKit

class WordViewController: UIViewController {
    
    
    var chosenWord = ""
    
    var searchWords = [WordUnit]()
    struct ViewModel {
        let wordUnit: String
        let phoneticUnits: [String]
        let synonyms: [String]
        let antonyms: [String]
        
    }
    
    var meaningCellViewModels: [MeaningTableViewCell.ViewModel] = []
    
    // Word Title
    let word = UILabel()
    
    //Phonetics
    let phoneticsStackView = UIStackView()
    let phoneticsButton = UIButton()
    let speakerImage = UIImageView()
    let emptyView = UIView()
    
    let meaningTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = .systemBackground
        fetchDataandLoadView()
        style()
        layout()
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
        
        // using this view as a spacer fo the stackview
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        
        meaningTableView.translatesAutoresizingMaskIntoConstraints = false
        meaningTableView.register(MeaningTableViewCell.self, forCellReuseIdentifier: MeaningTableViewCell.reuseID)
        meaningTableView.delegate = self
        meaningTableView.dataSource = self
        meaningTableView.rowHeight = 700
//        meaningTableView.rowHeight = UITableView.automaticDimension
        meaningTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    
    }
    
    private func layout() {
        view.addSubview(word)

        phoneticsStackView.addArrangedSubview(phoneticsButton)
        phoneticsStackView.addArrangedSubview(speakerImage)
        phoneticsStackView.addArrangedSubview(emptyView)
        view.addSubview(phoneticsStackView)
        
        view.addSubview(meaningTableView)
    
        NSLayoutConstraint.activate([
            word.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 12),
            word.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            
            phoneticsStackView.topAnchor.constraint(equalToSystemSpacingBelow: word.bottomAnchor, multiplier: 0),
            phoneticsStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: phoneticsStackView.trailingAnchor, multiplier: 2),
            
            meaningTableView.topAnchor.constraint(equalToSystemSpacingBelow: phoneticsStackView.bottomAnchor, multiplier: 1),
            meaningTableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: meaningTableView.trailingAnchor, multiplier: 1),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: meaningTableView.bottomAnchor, multiplier: 1)
            
        ])
    }
    
    @objc func playPhonetics(_ sender: UIButton) {
        print("jazz")
    }
    
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

//MARK: - TABLE VIEW DELEGATE

extension WordViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        meaningTableView.deselectRow(at: indexPath, animated: true)
        
    }
}

//MARK: - TABLEVIEW DATA SOURCE
extension WordViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MeaningTableViewCell.reuseID, for: indexPath) as! MeaningTableViewCell
        
            cell.definitionsNumber.text = "\(self.searchWords[0].meanings[indexPath.row].definitions.count)"
            cell.synonymNumberLabel.text = "\(self.searchWords[0].meanings[indexPath.row].synonyms.count)"
            cell.antonymNumberLabel.text = "\(self.searchWords[0].meanings[indexPath.row].antonyms.count)"
            cell.synonyms = self.searchWords[0].meanings[indexPath.row].synonyms
            cell.antonyms = self.searchWords[0].meanings[indexPath.row].antonyms
        
        return cell
    }
    
}

//MARK: - CONFIGURE VIEW

extension WordViewController {
    private func fetchDataandLoadView() {
        fetchWordUnits(forWord: chosenWord) { result in
            switch result {
            case .success(let wordUnits):
                self.searchWords = wordUnits
                self.word.text = self.searchWords[0].word
                self.phoneticsButton.setTitle(self.searchWords[0].phonetics[0].text, for: [])
//                self.configureTableCells(with: searchWords)
                self.meaningTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func configureTableCells(with wordUnits: [WordUnit]) {
        meaningCellViewModels = wordUnits.map {
            MeaningTableViewCell.ViewModel(partOfSpeech: $0.meanings[<#Int#>].partOfSpeech, definitionNumber: "\($0.meanings[$0].definitions.count)", synonymsNumber: "\($0.meanings[$0].synonyms.count)", synonyms: $0.meanings[$0].synonyms, antonymsNumber: "\($0.meanings[$0].antonyms.count)", antonyms: $0.meanings[$0].antonyms)

        }
    }
}

