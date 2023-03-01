//
//  QuestionController.swift
//  Trivia
//
//  Created by Baird, Seth J on 2/23/23.
//

import UIKit

class QuestionController: UIViewController {

    var selectedCategory: String = ""
    var selectedNumber: Int = 0
    var usingQuestions: [TriviaDB.Trivia]? = nil
    var currentIndex = 0
    
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var progress: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //use newly written data
        let pickFromCategory = TriviaDB.db[selectedCategory]
        
        //fill with empty elements
        usingQuestions = Array(repeating: TriviaDB.Trivia(q: "", correct: "", incorrect: [""]), count: selectedNumber)
        
        //change elements to picked questions
        for idx in (0...selectedNumber) {
            usingQuestions![idx] = (pickFromCategory?.randomElement())!
        }
    }
    
    func displayQuestion(idx: Int){
        var currentQuestion = usingQuestions![idx]
        mainText.text = currentQuestion.q
        var buttonTexts = currentQuestion.incorrect
        buttonTexts.append(currentQuestion.correct)
        buttonTexts.shuffle()
        
        for index in (0...4) {
            
        }
    }

}
