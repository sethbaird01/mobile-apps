//
//  QuestionController.swift
//  Trivia
//
//  Created by Baird, Seth J on 2/23/23.
//

import UIKit

class QuestionController: UIViewController {

    //these are passed in with didappear
    static var selectedCategory: String = ""
    static var selectedNumber: Int = 0
    
    //all questions to be used in current game
    var usingQuestions: [TriviaDB.Trivia] = []
    
    static var currentQuestionIdx = 0
    static var buttonTexts: [String] = []
    static var score: Int = 0
    
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var progress: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //get data from setupcontroller
        
        QuestionController.selectedCategory = SetupController.selectedCategory
        QuestionController.selectedNumber = SetupController.selectedNumber
        let pickFromCategory = TriviaDB.db[QuestionController.selectedCategory]
        
        //fill with empty elements
        usingQuestions = Array(repeating: TriviaDB.Trivia(q: "", correct: "", incorrect: [""]), count: QuestionController.selectedNumber)
        
        //change elements to picked questions
        for idx in (0...QuestionController.selectedNumber-1) {
            usingQuestions[idx] = (pickFromCategory!.randomElement())!
        }
        displayQuestion()
    }
    
    func displayQuestion(){
        if(QuestionController.currentQuestionIdx < QuestionController.selectedNumber){
            let currentQuestion = usingQuestions[QuestionController.currentQuestionIdx]
            mainText.text = currentQuestion.q
            QuestionController.buttonTexts = currentQuestion.incorrect
            QuestionController.buttonTexts.append(currentQuestion.correct)
            QuestionController.buttonTexts.shuffle()
            print(currentQuestion.correct)
            for index in (0...3) {
                buttons[index].setTitle(QuestionController.buttonTexts[index], for: .normal)
            }
        }else{
            gameOver()
            
        }

    }
    
    @IBAction func answerChoice(_ sender: UIButton) {
        if(sender.titleLabel!.text == usingQuestions[QuestionController.currentQuestionIdx].correct){
            print("correct")
            QuestionController.score += 1
        }else{
            print("incorrect")
        }
        QuestionController.currentQuestionIdx += 1
        displayQuestion()
        
    }
    
    func gameOver(){
        
    }
    
}
