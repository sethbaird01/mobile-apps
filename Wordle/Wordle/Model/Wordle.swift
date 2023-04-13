//
//  Wordle.swift
//  Wordle
//
//  Created by Baird, Seth J on 4/11/23.
//

import Foundation

class Wordle {
    let WORD_LEN: Int
    let DIFFICULTY_HARD: Bool
    let DICTIONARY: Dictionary

    var GOAL_WORD: String

    init(WORD_LEN: Int, DIFFICULTY_HARD: Bool) {
        self.WORD_LEN = WORD_LEN
        self.DIFFICULTY_HARD = DIFFICULTY_HARD
        self.DICTIONARY = Dictionary.init()

        //generate first word based on difficulty
        self.GOAL_WORD = "new"
    }

    func genWord(){
        GOAL_WORD = "new"
    }
    
    
}
