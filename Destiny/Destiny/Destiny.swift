//
//  Destiny.swift
//  Destiny
//
//  Created by Baird, Seth J on 9/14/22.
//

import Foundation

struct Destiny {
    var currentStory : Int = 0
    
    let stories = [ //construct Story objects inside the list
        Story(title: "The forest's path diverges.", choice1: "Go left", choice1index: 1, choice2: "Go right", choice2index: 2), //begin (0)
        
    Story(title: "This leads to a waterfall, there's a raft nearby.", choice1: "Look at the waterfall for a bit", choice1index: 3, choice2: "Take the raft and go down", choice2index: 4),//left path (1)
        
    Story(title: "There's a shack here, and inside there's a piece of paper on the desk. It reads, \"Game Over.\"", choice1: "The", choice1index: -1, choice2: "End", choice2index: -1),  //right path (2) end
        
    Story(title: "You look over the waterfall and within the mist you see letters that spell out, \"Game Over.\"", choice1: "The", choice1index: -1, choice2: "End", choice2index: -1), //stall (3)
        
    Story.init(title: "On the long fall down, the raft tumbles and capsizes leaving you in a shallow pool of crystal clear water. In the sand there's a gold coin.", choice1: "Leave it", choice1index: 5, choice2: "Kick it", choice2index: 5), //go down (4)
        
    Story.init(title: "Taking a closer look at the coin, you see ancient scribing spell out the phrase, \"Game Over.\"", choice1: "The", choice1index: -1, choice2: "End", choice2index: -1) //end (5)
    
    ]

    func currTitle() -> String {
        return stories[currentStory].title
    }
    
    func currChoices() -> [String] {
        return [stories[currentStory].choice1, stories[currentStory].choice2]
    }
    
    func currImage() -> String {
        return "\(currentStory)"
    }
    
    mutating func advanceTo(choiceNum: Int){
        if(currentStory != -1){
            if(choiceNum == 1){
                currentStory = stories[currentStory].choice1index
            }
            if (choiceNum == 2){
                currentStory = stories[currentStory].choice2index
            }
        }
    }
}
