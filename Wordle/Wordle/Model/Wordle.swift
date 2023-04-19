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
    var GOAL_ARRAY: [Character]
    var GOAL_LETTERS: Dictionary<Character, Int>
    var colors: [WordleColor]
    var deadLetters: Set<Character>

    init(WORD_LEN: Int, DIFFICULTY_HARD: Bool) {
        self.WORD_LEN = WORD_LEN
        self.DIFFICULTY_HARD = DIFFICULTY_HARD
        self.DICTIONARY = WordleDictionary.init()
        //must be lowercased
        self.GOAL_WORD = DICTIONARY.words.filter({$0.count == WORD_LEN}).randomElement()!.lowercased()
        self.GOAL_ARRAY = Array(GOAL_WORD)
        self.colors = Array(repeating: .GRAY, count: WORD_LEN)
        self.GOAL_LETTERS = Dictionary(uniqueKeysWithValues: zip(Set(GOAL_ARRAY), Array.init(repeating: 0, count: GOAL_WORD.count)))
        print("!!! \(GOAL_ARRAY)")
        for letter in GOAL_ARRAY {
            GOAL_LETTERS[letter]! += 1
        }
        print("!!! \(GOAL_LETTERS)")
        self.deadLetters = Set.init()
        print("!!! \(GOAL_WORD)")
    }
    
    func setDifficulty(new_hard: Bool){
        self.DIFFICULTY_HARD = new_hard
    }
}
