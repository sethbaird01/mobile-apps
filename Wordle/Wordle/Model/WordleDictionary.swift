//
//  Dictionary.swift
//  Wordle
//
//  Created by Baird, Seth J on 4/13/23.
//

import Foundation

class WordleDictionary {
    let FILE_PATH: String = Bundle.main.path(forResource: "dictionary", ofType: "txt")!
    var words: Set<String>
    
    init() {        
        self.words = Set(try! String(contentsOf:URL(filePath: FILE_PATH)).components(separatedBy: "\n"))
    }
}
