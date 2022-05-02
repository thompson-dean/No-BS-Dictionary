//
//  MainViewController.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/05/02.
//

import UIKit

import UIKit

class MainViewController: UIViewController {
    
    var savedTerms = ["Esoteric", "Free", "Jazz", "Coalesce", "Funk"]
    
    let dictTitle = UILabel()
    let stackView = UIStackView()
    let searchBar = UISearchBar(frame: .zero)
    let recentLabel = UILabel()
    let recentTableView = UITableView()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        style()
        layout()
    }
}

extension MainViewController {
    private func style() {
        
        dictTitle.translatesAutoresizingMaskIntoConstraints = false
        dictTitle.text = "Dictionary"
        dictTitle.font = UIFont(name: "Charter-Black", size: 40)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search..."
        searchBar.delegate = self
        
        recentLabel.translatesAutoresizingMaskIntoConstraints = false
        recentLabel.text = "Recent"
        recentLabel.font = UIFont(name: "Charter-Black", size: 30)
        
        recentTableView.translatesAutoresizingMaskIntoConstraints = false
        recentTableView.delegate = self
        recentTableView.dataSource = self
        recentTableView.rowHeight = 32
        recentTableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        recentTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
    }
    
    private func layout() {
    
        view.addSubview(dictTitle)
        stackView.addArrangedSubview(searchBar)
        view.addSubview(stackView)
        view.addSubview(recentLabel)
        view.addSubview(recentTableView)
        
        NSLayoutConstraint.activate([
            dictTitle.topAnchor.constraint(equalToSystemSpacingBelow: view.topAnchor, multiplier: 30),
            dictTitle.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: dictTitle.bottomAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            
            recentLabel.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 4),
            recentLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 3),
            
            recentTableView.topAnchor.constraint(equalToSystemSpacingBelow: recentLabel.bottomAnchor, multiplier: 2),
            recentTableView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: recentTableView.trailingAnchor, multiplier: 1),
            view.bottomAnchor.constraint(equalToSystemSpacingBelow: recentTableView.bottomAnchor, multiplier: 2)
            
            
            
            
            
        ])
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("Tapped")
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        savedTerms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.font = UIFont(name: "Futura-Medium", size: 16)
        cell.textLabel?.alpha = 0.7
        cell.textLabel?.text = savedTerms[indexPath.row]
        return cell
    
    }
    
    
}
