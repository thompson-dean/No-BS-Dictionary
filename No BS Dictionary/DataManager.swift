//
//  DataManager.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/03/25.
//

import Foundation

class DataManager {
    
    var dataTask: URLSessionDataTask?
    
    func fetch(searchWord: String, completion: @escaping ([WordUnit]) -> Void) {
        
        let api = "https://api.dictionaryapi.dev/api/v2/entries/en/hello"
        
        guard let url = URL(string: "\(api)\(searchWord)") else { return }
        
        dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("DEBUG: did not start URLSesh. \(error.localizedDescription)")
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([WordUnit].self, from: data)
                completion(result)
            } catch {
                print("DEBUG: did not decode. \(error.localizedDescription)")
            }
                      
        }
        
        dataTask?.resume()
    }
}
