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
        var guessedArray = Array(guessedWord)
        
        GameViewController.wordle.colors = Array(repeating: WordleColor.GRAY, count: GameViewController.wordle.WORD_LEN)
        if(guessedWord.count != GameViewController.wordle.WORD_LEN || !GameViewController.wordle.dict_counted.contains(guessedWord.uppercased())){
            //incorrect length or invalid word
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
                    //greens
                    if(letter == Array(GameViewController.wordle.GOAL_WORD)[index]){
                        GameViewController.wordle.colors[index] = .GREEN
                    } else
                     if(GameViewController.wordle.GOAL_LETTERS.keys.contains(letter)){
                         //yellows
                        GameViewController.wordle.colors[index] = .YELLOW
                    }else{
                        //grays
                        GameViewController.wordle.deadLetters.insert(letter)
                    }
                    index += 1
                    //for each end
                }
            }
        //only runs on valid word
            updateCells(row: currentRow, guessed: guessedWord)
            updateDeadLetters()
            currentRow += 1
        }
    }
    
    @IBOutlet weak var mainStack: UIStackView!

    func updateCells(row: Int, guessed: String){
        let guessedLetters = Array(guessed)
        var index = 0
        for cell in mainStack.subviews[row].subviews{
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
    
    func indexOfAll(elem: Character, arr: [Character]) -> Set<Int>{
        var index = 0
        var found: Set<Int> = []
        for each in arr {
            if(each == elem){
                found.insert(index)
            }
            index += 1
        }
        return found
    }
}
