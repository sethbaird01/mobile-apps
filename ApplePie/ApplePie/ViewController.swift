//
//  ViewController.swift
//  ApplePie
//
//  Created by Baird, Seth J on 11/9/22.
//

import UIKit

class ViewController: UIViewController {
    
    var wins = 0
    var losses = 0
    var goalWord = ""
    var guessedLetters: [Character] = []
    var moves = 7
    var dictionary: [String] = ["abruptly", "absurd", "abyss", "affix", "askew", "avenue", "awkward", "axiom", "azure", "bagpipes", "bandwagon", "banjo", "bayou", "beekeeper", "blitz", "blizzard", "boggle", "bookworm", "boxcar", "boxful", "buckaroo", "buffalo", "buffoon", "buxom", "buzzard", "buzzing", "buzzwords", "cobweb", "croquet", "crypt", "curacao", "cycle", "daiquiri", "dizzying", "duplex", "dwarves", "embezzle", "equip", "espionage", "exodus", "faking", "fishhook", "fixable", "fjord", "flapjack", "flopping", "flyby", "foxglove", "frazzled", "frizzled", "fuchsia", "funny", "gabby", "galaxy", "galvanize", "gazebo", "gizmo", "glowworm", "glyph", "gnarly", "gnostic", "gossip", "grogginess", "haiku", "haphazard", "hyphen", "icebox", "injury", "ivory", "ivy", "jackpot", "jaundice", "jawbreaker", "jaywalk", "jazziest", "jazzy", "jelly", "jigsaw", "jinx", "jiujitsu", "jockey", "jogging", "joking", "jovial", "joyful", "jukebox", "jumbo", "kayak", "kazoo", "khaki", "kilobyte", "kiosk", "kitsch", "kiwifruit", "klutz", "knapsack", "larynx", "lengths", "lucky", "luxury", "lymph", "marquis", "matrix", "megahertz", "microwave", "mnemonic", "mystify", "nightclub", "nowadays", "nymph", "onyx", "oxidize", "oxygen", "pajama", "peekaboo", "phlegm", "pixel", "pizazz", "pneumonia", "psyche", "puppy", "puzzling", "quartz", "queue", "quips", "quiz", "quizzes", "quorum", "rhubarb", "rhythm", "rickshaw", "scratch", "snazzy", "sphinx", "spritz", "squawk", "staff", "strength", "strengths", "stretch", "stronghold", "stymied", "subway", "swivel", "syndrome", "thriftless", "thumbscrew", "topaz", "transcript", "transplant", "twelfth", "unknown", "unworthy", "unzip", "uptown", "vaporize", "vixen", "voodoo", "vortex", "walkway", "waltz", "wave", "wavy", "waxy", "wellspring", "wheezy", "whiskey", "whizzing", "whomever", "witchcraft", "wizard", "woozy", "wristwatch", "wyvern", "xylophone", "yachtsman", "yippee", "yoked", "youthful", "yummy", "zephyr", "zigzag", "zilch", "zipper", "zodiac", "zombie"]

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var guessedLettersLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    @IBAction func textFieldEntry(_ sender: UITextField) {
        //gather letters
        guessedLetters.append(contentsOf: (Array(sender.text?.lowercased() ?? "")))
        guessedLettersLabel.text = "Guessed: \(guessedLetters.map{String($0)}.joined(separator: " "))"
        textField.text = ""
        
        //check letters
        var guessedWord = ""
        for letter in goalWord {
                if guessedLetters.contains(letter) {
                    guessedWord += "\(letter)"
                } else {
                    guessedWord += "_ "
                }
            }
        
        //won
        if(guessedWord == goalWord){
            gameEnd(won: true)
        }
        
        if(wordLabel.text == guessedWord){
            //nothing changed
            moves -= 1
            image.image = UIImage.init(named: "Tree \(moves)")
            
            //lost
            if(moves == -1){
                gameEnd(won: false)
            }
        }else{
            //continue with no point reduction
            wordLabel.text = guessedWord
        }
    }
    
    func initUI() {
        moves = 7
        image.image = UIImage.init(named: "Tree \(moves)")
        goalWord = dictionary.remove(at: Int.random(in: 0...dictionary.endIndex))
//        goalWord = "easyword"
        wordLabel.text = String.init(repeating: "_ ", count: goalWord.count)
        scoreLabel.text = getScoreText()
        guessedLetters = []
        guessedLettersLabel.text = ""
        textField.text = ""
    }
    
    @IBAction func resetButton(_ sender: Any) {
        initUI()
    }
    
    func gameEnd(won: Bool){
        if won{
            //change score var
            wins += 1;
            
            //create and present alert
            let dialogMessage = UIAlertController(title: "You Won!", message: "The word was \(goalWord). \(getScoreText())", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Reset Game", style: .default, handler: { (action) -> Void in
                self.initUI()
             })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)

        }else{
            //change score var
            losses += 1;
            
            //create and present alert
            let dialogMessage = UIAlertController(title: "Out of moves...", message: "The word was \(goalWord). \(getScoreText())", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Reset Game", style: .default, handler: { (action) -> Void in
                self.initUI()
             })
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        
        }
    }
    
    func getScoreText() -> String{
        return "Wins: \(wins), Losses: \(losses)"
    }
    


}

