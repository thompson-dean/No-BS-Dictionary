//
//  Bundle.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/03/25.
//

import Foundation


extension Bundle {
    func decode<T: Decodable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("no url")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("no data")
        }
        
        let decoder = JSONDecoder()
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
         fatalError("no decoding")
        }
        
        return loaded
    }
    
    func getTxt() -> [String] {
        if let fileURL = Bundle.main.url(forResource: "wordlist", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                return fileContents.components(separatedBy: "\n")
            }
        }
        return []
    }
}
