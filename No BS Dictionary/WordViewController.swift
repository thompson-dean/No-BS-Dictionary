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
    
    //Parts of Speech
    let partOfSpeechStackView = UIStackView()
    let partOfSpeechTitle = UILabel()
    let partOfSpeech = UILabel()
    
    //Definitions
    let definitionTitleView = TitleView(frame: .zero, title: "DEFINITION", number: 5)
    let definitionLabel = UILabel()
    let openButton = UIButton()
    
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
        
        partOfSpeechStackView.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeechStackView.axis = .vertical
        partOfSpeechStackView.spacing = 2
        
        partOfSpeechTitle.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeechTitle.text = "PART OF SPEECH"
        partOfSpeechTitle.font = .boldSystemFont(ofSize: 16)
        
        partOfSpeech.translatesAutoresizingMaskIntoConstraints = false
        partOfSpeech.font = .preferredFont(forTextStyle: .subheadline)
        partOfSpeech.text = "noun"
        
        definitionLabel.translatesAutoresizingMaskIntoConstraints = false
        definitionLabel.attributedText = attributedText(withString: " A musical art form rooted in West African cultural and musical expression and in the African American blues tradition, with diverse influences over time, commonly characterized by blue notes, syncopation, swing, call and response, polyrhythms and improvisation.", boldString: "1.")
        definitionLabel.numberOfLines = 0
        definitionLabel.font = .preferredFont(forTextStyle: .subheadline)
        
        openButton.translatesAutoresizingMaskIntoConstraints = false
        openButton.setTitle("more..", for: [])
        openButton.setTitleColor(.systemBlue, for: [])
        openButton.titleLabel?.font = .preferredFont(forTextStyle: .subheadline)

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
        
        partOfSpeechStackView.addArrangedSubview(partOfSpeechTitle)
        partOfSpeechStackView.addArrangedSubview(partOfSpeech)
        view.addSubview(partOfSpeechStackView)
        
        view.addSubview(definitionTitleView)
    
        view.addSubview(definitionLabel)
        
        view.addSubview(openButton)
    
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
            
            partOfSpeechStackView.topAnchor.constraint(equalToSystemSpacingBelow: phoneticsStackView.bottomAnchor, multiplier: 3),
            partOfSpeechStackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: partOfSpeechStackView.trailingAnchor, multiplier: 2),
            
            definitionTitleView.topAnchor.constraint(equalToSystemSpacingBelow: partOfSpeechStackView.bottomAnchor, multiplier: 3),
            definitionTitleView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: definitionTitleView.trailingAnchor, multiplier: 2),
            
            definitionLabel.topAnchor.constraint(equalToSystemSpacingBelow: definitionTitleView.bottomAnchor, multiplier: 1),
            definitionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: definitionLabel.trailingAnchor, multiplier: 3),
            
            openButton.topAnchor.constraint(equalToSystemSpacingBelow: definitionLabel.bottomAnchor, multiplier: 0),
            openButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            
            synonymsTitleView.topAnchor.constraint(equalToSystemSpacingBelow: openButton.bottomAnchor, multiplier: 2),
            synonymsTitleView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            
            synonymTableView.topAnchor.constraint(equalToSystemSpacingBelow: synonymsTitleView.bottomAnchor, multiplier: 1),
            synonymTableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            synonymTableView.widthAnchor.constraint(equalToConstant: 150),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: synonymTableView.bottomAnchor, multiplier: 2),
            
            antonymsTitleView.topAnchor.constraint(equalToSystemSpacingBelow: openButton.bottomAnchor, multiplier: 2),
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
        } else {
            let vc = WordViewController()
            vc.word.text = antonyms[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
            antonymsTableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
}

extension WordViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return synonyms.count
        } else {
            return antonyms.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "synonymCell", for: indexPath)
            cell.textLabel?.font = .preferredFont(forTextStyle: .subheadline)
            cell.textLabel?.text = synonyms[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "antonymCell", for: indexPath)
            cell.textLabel?.font = .preferredFont(forTextStyle: .subheadline)
            cell.textLabel?.text = antonyms[indexPath.row]
            return cell
        }
        
    }
    
}
