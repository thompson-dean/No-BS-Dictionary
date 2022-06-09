//
//  WordViewModel.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/06/01.
//

import Foundation

struct WordViewModel {
    var wordUnits: [WordUnit] = []
    
    func fetchSearchedWordsList(forSearchTerm searchTerm: String, completion: @escaping (Result<[WordUnit], NetworkError>) -> Void) {
        guard let url = URL(string: "https://api.dictionaryapi.dev/api/v2/entries/en/\(searchTerm)") else { return }
        print(url)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(.failure(.serverError))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    
                    let wordUnits = try decoder.decode([WordUnit].self, from: data)
                    completion(.success(wordUnits))
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
    }
    
}
