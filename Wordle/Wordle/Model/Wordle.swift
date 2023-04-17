//
//  Wordle.swift
//  Wordle
//
//  Created by Baird, Seth J on 4/11/23.
//

import Foundation

class Wordle {
    let WORD_LEN: Int
    var DIFFICULTY_HARD: Bool
    let DICTIONARY: WordleDictionary
    var GOAL_WORD: String
    var GOAL_LETTERS: Dictionary<String, Int>
    var colors: [WordleColor]

    init(WORD_LEN: Int, DIFFICULTY_HARD: Bool) {
        self.WORD_LEN = WORD_LEN
        self.DIFFICULTY_HARD = DIFFICULTY_HARD
        self.DICTIONARY = WordleDictionary.init()
        self.GOAL_WORD = DICTIONARY.words.filter({$0.count == WORD_LEN}).randomElement()!.lowercased()
        self.colors = Array(repeating: .GRAY, count: WORD_LEN)
        self.GOAL_LETTERS = Dictionary()
        for letter in GOAL_WORD.components(separatedBy: "") {
            GOAL_LETTERS[letter]! += 1
        }
        print("!!! \(GOAL_WORD)")
    }
    
    func setDifficulty(new_hard: Bool){
        self.DIFFICULTY_HARD = new_hard
    }
}
