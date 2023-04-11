//
//  Entry.swift
//  Wordle
//
//  Created by Baird, Seth J on 4/11/23.
//

import Foundation

class Entry {
    var text: String
    var uniqueLetters: Set<Character>
    
    init(text: String, uniqueLetters: Set<Character>) {
        self.text = text
        self.uniqueLetters = text.capitalized.components(separatedBy: "").forEach(/*convert single letter strings to Characters for use in set*/)
    }
}
