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
    let phonetics: [Phonetic]
    let meanings: [Meaning]
}

struct Phonetic: Codable {
    let text: String
    let audio: String
}

struct Meaning: Codable {
    let partOfSpeech: String
    let definitions: [Definition]
    let synonyms: [String]
    let antonyms: [String]
}

struct Definition: Codable {
    let definition: String
    let example: String?
}



