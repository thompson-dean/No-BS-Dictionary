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
    let text: String?
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

//MARK: - Fake Data to test UI

//var fakeData = [
//    WordUnit(
//        word: "big",
//        phonetics: [
//            Phonetic(
//                text: "/bɪɡ/",
//                audio: "https://api.dictionaryapi.dev/media/pronunciations/en/big-uk.mp3")],
//        meanings: [
//            Meaning(
//                partOfSpeech: "noun",
//                definitions: [
//                    Definition(
//                        definition: "Someone or something that is large in stature",
//                        example: nil),
//                    Definition(
//                        definition: "An important or powerful person; a celebrity; a big name.",
//                        example: nil),
//                    Definition(
//                        definition: "(as plural) The big leagues, big time.",
//                        example: nil),
//                    Definition(
//                        definition: "(BDSM) The participant in ageplay who acts out the older role.",
//                        example: nil)],
//                synonyms:[
//                    "ample",
//                    "huge",
//                    "jumbo",
//                    "large",
//                    "massive",
//                    "sizeable",
//                    "stoor"
//                ],
//                antonyms: [
//                    "little",
//                    "miniature",
//                    "minuscule",
//                    "minute",
//                    "small",
//                    "tiny"
//                ]
//            ),
//            Meaning(
//                partOfSpeech: "adjective",
//                definitions: [
//                    Definition(
//                        definition: "Of great size, large.",
//                        example: "Elephants are big animals, and they eat a lot."),
//                    Definition(
//                        definition: "Fat.",
//                        example: "Gosh, she is big!")
//                ],
//                synonyms:[
//                    "adult",
//                    "fully grown",
//                    "grown up",
//                    "all the rage",
//                    "in demand",
//                    "well liked",
//                    "ample",
//                    "huge",
//                    "jumbo",
//                    "large",
//                    "massive",
//                    "sizeable",
//                    "stoor",
//                    "busty",
//                    "macromastic",
//                    "stacked",
//                    "chubby",
//                    "plus-size",
//                    "rotund",
//                    "essential",
//                    "paramount",
//                    "weighty",
//                    "fanatical",
//                    "mad",
//                    "worked up",
//                    "full",
//                    "great",
//                    "heavy"
//                    ],
//                antonyms: [
//                    "little",
//                    "miniature",
//                    "minuscule",
//                    "minute",
//                    "small",
//                    "tiny",
//                    "little",
//                    "young"
//                    ]
//            )
//        ]
//    )
//]


