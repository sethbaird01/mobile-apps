//
//  ViewController.swift
//  Wordle
//
//  Created by Baird, Seth J on 4/11/23.
//

import UIKit

class GameViewController: UIViewController {
    var currentRow: Int = 0
    static var wordle: Wordle = Wordle.init(WORD_LEN: 5, DIFFICULTY_HARD: false)
    let NUM_ROWS = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        print(GameViewController.wordle.GOAL_WORD)
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var deadLettersOut: UILabel!
    @IBOutlet weak var textFieldOutlet: CustomTextField!
    
    //fires on keyboard enter
    @IBAction func textEntry(_ sender: Any) {
        //must be lowercased
        let guessedWord: String = textFieldOutlet.text!.lowercased()
        textFieldOutlet.text = ""
        let guessedArray = Array(guessedWord)
        GameViewController.wordle.colors = Array(repeating: WordleColor.GRAY, count: GameViewController.wordle.WORD_LEN)
        if(guessedWord.count != GameViewController.wordle.WORD_LEN){
            //incorrect length
            textFieldOutlet.shake()
            textFieldOutlet.text = ""
        }else{
            //correct length
            if(guessedWord == GameViewController.wordle.GOAL_WORD){
                //correct word
                GameViewController.wordle.colors = Array(repeating: WordleColor.GREEN, count: GameViewController.wordle.WORD_LEN)
                print("!!! game over")
            }else{
                //incorrect word
                var index: Int = 0
                for letter in guessedArray {
                    //yellows
                    if(GameViewController.wordle.GOAL_LETTERS.keys.contains(letter)){
//  one vs two yellows case unimplemented
                        GameViewController.wordle.colors[index] = .YELLOW
                    }else{
                        GameViewController.wordle.deadLetters.insert(letter)
                    }
                    //greens
                    if(letter == Array(GameViewController.wordle.GOAL_WORD)[index]){
                        GameViewController.wordle.colors[index] = .GREEN
                    }
                    index += 1
                    //for end
                }
            }
        }
        updateCells(row: currentRow, guessed: guessedWord)
        updateDeadLetters()
        currentRow += 1
    }
    
    @IBOutlet weak var mainStack: UIStackView!

    func updateCells(row: Int, guessed: String){
        var guessedLetters = Array(guessed)
        var rowElems = mainStack.subviews
        var index = 0
        for cell in rowElems[row].subviews{
            switch GameViewController.wordle.colors[index] {
            case .GREEN:
                cell.backgroundColor = .systemGreen
            case .YELLOW:
                cell.backgroundColor = .systemYellow
            case .GRAY:
                cell.backgroundColor = .systemGray4
            }
            (cell as! UILabel).text = String(guessedLetters[index]).uppercased()
                index += 1
        }
    }
    
    func updateDeadLetters(){
        deadLettersOut.text = GameViewController.wordle.deadLetters.compactMap({"\($0), "}).joined().trimmingCharacters(in: .whitespaces).trimmingCharacters(in: .punctuationCharacters)
    }
}
