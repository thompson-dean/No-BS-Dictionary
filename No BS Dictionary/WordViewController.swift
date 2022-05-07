//
//  WordViewController.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/05/05.
//

import UIKit

class WordViewController: UIViewController {

    let dataManager = DataManager()
    
    var synonyms = [
        "accomplished",
        "all right",
        "decent",
        "not bad",
        "satisfactory",
        "well"
        ]
    var antonyms = [
        "bad",
        "evil",
        "bad",
        "poor"
        ]
    
    let word = UILabel()
    
    //Phonetics
    let phoneticsStackView = UIStackView()
    let phoneticsButton = UIButton()
    let speakerImage = UIImageView()
    let emptyView = UIView()
    
    let definitionTableView = UITableView()
    
    //synonyms
    let synonymsTitleView = TitleView(frame: .zero, title: "SYNONYMS", number: 6)
    let synonymTableView = UITableView()
    
    //antonyms
    let antonymsTitleView = TitleView(frame: .zero, title: "ANTONYMS", number: 4)
    let antonymsTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.fetch(searchWord: "jazz") { result in
            DispatchQueue.main.async {
                self.word.text = result[0].word
            }
        }
        view.backgroundColor = .systemBackground
        style()
        layout()
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
        phoneticsButton.setTitle("/d͡ʒæz/", for: [])
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

        synonymTableView.translatesAutoresizingMaskIntoConstraints = false
        synonymTableView.tag = 0
        synonymTableView.delegate = self
        synonymTableView.dataSource = self
        synonymTableView.rowHeight = 23
        synonymTableView.register(UITableViewCell.self, forCellReuseIdentifier: "synonymCell")
        synonymTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
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
    
        view.addSubview(synonymsTitleView)
        view.addSubview(synonymTableView)
        
        view.addSubview(antonymsTitleView)
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
            
            synonymsTitleView.topAnchor.constraint(equalToSystemSpacingBelow: definitionTableView.bottomAnchor, multiplier: 2),
            synonymsTitleView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            
            synonymTableView.topAnchor.constraint(equalToSystemSpacingBelow: synonymsTitleView.bottomAnchor, multiplier: 1),
            synonymTableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            synonymTableView.widthAnchor.constraint(equalToConstant: 150),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: synonymTableView.bottomAnchor, multiplier: 2),
            
            antonymsTitleView.topAnchor.constraint(equalToSystemSpacingBelow: definitionTableView.bottomAnchor, multiplier: 2),
            antonymsTitleView.leadingAnchor.constraint(equalToSystemSpacingAfter: synonymTableView.trailingAnchor, multiplier: 4),
            
            antonymsTableView.topAnchor.constraint(equalToSystemSpacingBelow: antonymsTitleView.bottomAnchor, multiplier: 1),
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

extension WordViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 0 {
            synonymTableView.deselectRow(at: indexPath, animated: true)
            let vc = WordViewController()
            vc.word.text = synonyms[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        } else if tableView.tag == 1 {
            let vc = WordViewController()
            vc.word.text = antonyms[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
            antonymsTableView.deselectRow(at: indexPath, animated: true)
        } else {
            definitionTableView.deselectRow(at: indexPath, animated: false)
        }
        
    }
}

extension WordViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return synonyms.count
        } else if tableView.tag == 1 {
            return antonyms.count
        } else {
            return fakeData[0].meanings.count
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
            cell.configure(partOfSpeech: fakeData[0].meanings[indexPath.row].partOfSpeech, definition: fakeData[0].meanings[indexPath.row].definitions[0].definition)
            return cell
        }
        
    }
    
}
