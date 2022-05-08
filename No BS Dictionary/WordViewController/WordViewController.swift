//
//  WordViewController.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/05/05.
//

import UIKit

class WordViewController: UIViewController {
    
    
    var chosenWord = ""
    
    var synonyms = [String]()
    var antonyms = [String]()
    
    struct ViewModel {
        let wordUnit: String
        let phoneticUnits: [String]
        let synonyms: [String]
        let antonyms: [String]
        
    }
    
    // Word Title
    let word = UILabel()
    
    //Phonetics
    let phoneticsStackView = UIStackView()
    let phoneticsButton = UIButton()
    let speakerImage = UIImageView()
    let emptyView = UIView()
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = .systemBackground
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
        
        definitionTableView.translatesAutoresizingMaskIntoConstraints = false
        definitionTableView.register(DefinitionTableViewCell.self, forCellReuseIdentifier: DefinitionTableViewCell.reuseID)
        definitionTableView.tag = 2
        definitionTableView.delegate = self
        definitionTableView.dataSource = self
        definitionTableView.rowHeight = 150
        definitionTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
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
        view.addSubview(word)
        
        
        phoneticsStackView.addArrangedSubview(phoneticsButton)
        phoneticsStackView.addArrangedSubview(speakerImage)
        phoneticsStackView.addArrangedSubview(emptyView)
        view.addSubview(phoneticsStackView)
    
        view.addSubview(definitionTableView)
    
        synonymStackView.addArrangedSubview(synonymTitleLabel)
        synonymStackView.addArrangedSubview(synonymNumberLabel)
        synonymStackView.addArrangedSubview(synonymEmptyView)
        view.addSubview(synonymStackView)
        view.addSubview(synonymTableView)
        
        antonymStackView.addArrangedSubview(antonymTitleLabel)
        antonymStackView.addArrangedSubview(antonymNumberLabel)
        antonymStackView.addArrangedSubview(antonymEmptyView)
        view.addSubview(antonymStackView)
        view.addSubview(antonymsTableView)
        
        NSLayoutConstraint.activate([
            word.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 12),
            word.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            
            phoneticsStackView.topAnchor.constraint(equalToSystemSpacingBelow: word.bottomAnchor, multiplier: 1),
            phoneticsStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: phoneticsStackView.trailingAnchor, multiplier: 2),
            
            definitionTableView.topAnchor.constraint(equalToSystemSpacingBelow: phoneticsStackView.bottomAnchor, multiplier: 0),
            definitionTableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: definitionTableView.trailingAnchor, multiplier: 0),
            definitionTableView.heightAnchor.constraint(equalToConstant: 250),
            
            synonymStackView.topAnchor.constraint(equalToSystemSpacingBelow: definitionTableView.bottomAnchor, multiplier: 2),
            synonymStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            
            synonymTableView.topAnchor.constraint(equalToSystemSpacingBelow: synonymStackView.bottomAnchor, multiplier: 1),
            synonymTableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 0),
            synonymTableView.widthAnchor.constraint(equalToConstant: 150),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: synonymTableView.bottomAnchor, multiplier: 2),
            
            antonymStackView.topAnchor.constraint(equalToSystemSpacingBelow: definitionTableView.bottomAnchor, multiplier: 2),
            antonymStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: synonymTableView.trailingAnchor, multiplier: 6),
            
            antonymsTableView.topAnchor.constraint(equalToSystemSpacingBelow: antonymStackView.bottomAnchor, multiplier: 1),
            antonymsTableView.leadingAnchor.constraint(equalToSystemSpacingAfter: synonymTableView.trailingAnchor, multiplier: 4),
            antonymsTableView.widthAnchor.constraint(equalToConstant: 150),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: antonymsTableView.bottomAnchor, multiplier: 2)
            
            
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
        if tableView.tag == 0 {
            synonymTableView.deselectRow(at: indexPath, animated: true)
//            let vc = WordViewController()
//            vc.chosenWord =
//            self.navigationController?.pushViewController(vc, animated: true)
        } else if tableView.tag == 1 {
//            let vc = WordViewController()
//
//            self.navigationController?.pushViewController(vc, animated: true)
            antonymsTableView.deselectRow(at: indexPath, animated: true)
        } else {
            definitionTableView.deselectRow(at: indexPath, animated: false)
        }
        
    }
}

//MARK: - TABLEVIEW DATA SOURCE
extension WordViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return synonyms.count
        } else if tableView.tag == 1 {
            return antonyms.count
        } else {
            return 2
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
            cell.configure(partOfSpeech: fakeData[1].meanings[indexPath.row].partOfSpeech, definition: fakeData[1].meanings[indexPath.row].definitions[0].definition)
            return cell
        }
        
    }
    
}

//MARK: - CONFIGURE VIEW

extension WordViewController {
    private func fetchDataandLoadView() {
        fetchWordUnits(forWord: chosenWord) { result in
            switch result {
            case .success(let wordUnits):
                
                self.word.text = wordUnits[0].word
                self.synonyms = wordUnits[0].meanings[0].synonyms
                self.antonyms = wordUnits[0].meanings[0].antonyms
                self.antonymNumberLabel.text = "\(wordUnits[0].meanings[0].antonyms.count)"
                self.synonymNumberLabel.text = "\(wordUnits[0].meanings[0].synonyms.count)"
                
                
                
                self.definitionTableView.reloadData()
                self.synonymTableView.reloadData()
                self.antonymsTableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            
        }
    }
}

