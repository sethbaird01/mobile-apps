//
//  Tile.swift
//  Wordle
//
//  Created by Baird, Seth J on 4/13/23.
//

import Foundation
import UIKit

class Tile{
    var color: WordleColor = WordleColor.GRAY
    var letter: Character
    let label: UILabel
    
    init(letter: Character, label: UILabel){
        self.letter = letter
        self.label = label
    }
}
