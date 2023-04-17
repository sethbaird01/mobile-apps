//
//  ViewController.swift
//  Wordle
//
//  Created by Baird, Seth J on 4/11/23.
//

import UIKit

class GameViewController: UIViewController {
    static var wordle: Wordle = Wordle.init(WORD_LEN: 5, DIFFICULTY_HARD: false)
    override func viewDidLoad() {
        super.viewDidLoad()
        print(GameViewController.wordle.GOAL_WORD)
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var textFieldOutlet: CustomTextField!
    
    //fires on keyboard enter
    @IBAction func textEntry(_ sender: Any) {
        let guessedWord: String = textFieldOutlet.text!.lowercased()
        if(guessedWord.count != GameViewController.wordle.WORD_LEN){
            //incorrect length
            textFieldOutlet.shake()
            textFieldOutlet.text = ""
        }else{
            //correct length
            if(guessedWord == GameViewController.wordle.GOAL_WORD){
                //correct word
                print("!!! game over")
            }else{
                //incorrect word
                var index: Int = 0
                for letter in guessedWord.components(separatedBy: "") {
                    //yellows
                    if(GameViewController.wordle.GOAL_LETTERS.keys.contains(letter)){
                        GameViewController.wordle.colors[index] = .YELLOW
                    }
                    //greens
                    if(){
                        
                    }
                    index += 1
                }
                updateColors()
            }
        }
    }
    
    @IBOutlet weak var mainStack: UIStackView!
    func updateColors(){
        
    }
}

