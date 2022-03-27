//
//  HomeViewController.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/03/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let dataManager = DataManager()
    var searchWords = Bundle.main.getTxt()
    
    lazy var searchController: UISearchController = {
       let searchController = UISearchController()
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        return searchController
        
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = .systemBackground
        return tableView
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "Dictionary"
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        constraints()
        
        navigationItem.searchController = UISearchController(searchResultsController: nil)
        navigationItem.hidesSearchBarWhenScrolling = false
        
        
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchWords.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = searchWords[indexPath.row]
        return cell
    }
    
    
    
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchWords = searchWords.filter({ $0.lowercased().contains(searchText.lowercased())})
        tableView.reloadData()
    }
}
