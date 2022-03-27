//
//  Word.swift
//  No BS Dictionary
//
//  Created by Dean Thompson on 2022/03/25.
//

import Foundation


// MARK: - WordUnit
struct WordUnit: Codable {
    let word: String
    let meanings: [Meaning]
    
    struct Meaning: Codable {
        let partOfSpeech: String
        let definitions: [Definition]
    }

    struct Definition: Codable {
        let definition, example: String?
        let synonyms, antonyms: [String]
    }
}



