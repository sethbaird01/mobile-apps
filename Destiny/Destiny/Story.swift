//
//  File.swift
//  Destiny
//
//  Created by Baird, Seth J on 9/14/22.
//

import Foundation


struct Story {
    init(title: String, choice1: String, choice1index: Int, choice2: String, choice2index: Int) {
        self.title = title
        self.choice1 = choice1
        self.choice1index = choice1index
        self.choice2 = choice2
        self.choice2index = choice2index
    }
    
    let title: String
    let choice1: String
    let choice1index: Int
    let choice2: String
    let choice2index: Int
    
    //do init
}
