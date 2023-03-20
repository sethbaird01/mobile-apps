//
//  QuestionController.swift
//  Trivia
//
//  Created by Baird, Seth J on 2/23/23.
//

import UIKit

class QuestionController: UIViewController {
    
    //these are passed in with didappear
    static var selectedCategory: String = Array(TriviaDB.db.keys)[0]
    static var selectedNumber: Int = 3
    
    //all questions to be used in current game
    static var usingQuestions: [TriviaDB.Trivia] = []
    
    static var currentQuestionIdx = 0
    static var buttonTexts: [String] = []
    static var score: Int = 0
    var doneAnimating = true
    
    @IBOutlet weak var mainText: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var status: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //get data from setupcontroller
        
        QuestionController.selectedCategory = SetupController.selectedCategory
        QuestionController.selectedNumber = SetupController.selectedNumber
        let pickFromCategory = TriviaDB.db[QuestionController.selectedCategory]
        
        //fill with empty elements
        QuestionController.usingQuestions = Array(repeating: TriviaDB.Trivia(q: "", correct: "", incorrect: [""]), count: QuestionController.selectedNumber)
        
        //change elements to picked questions

        for idx in (0...QuestionController.selectedNumber-1) {
            QuestionController.usingQuestions[idx] = (pickFromCategory!.randomElement())!
        }
        progress.progress = 0
        displayQuestion()
    }
    
    func displayQuestion(){
        if(QuestionController.currentQuestionIdx < QuestionController.selectedNumber){
            let currentQuestion = QuestionController.usingQuestions[QuestionController.currentQuestionIdx]
            mainText.text = currentQuestion.q
            QuestionController.buttonTexts = currentQuestion.incorrect
            QuestionController.buttonTexts.append(currentQuestion.correct)
            QuestionController.buttonTexts.shuffle()
            print(currentQuestion.correct)
            setButtons()
            progress.setProgress((Float) (QuestionController.currentQuestionIdx / QuestionController.selectedNumber), animated: true)
        }else{
            //end game and display results
            
            tabBarController?.selectedIndex = 2
            mainText.text = "No game in progress"
            QuestionController.buttonTexts = ["A","B","C","D"]
            setButtons()
            QuestionController.resetUI()
        }
        
    }
    
    func setButtons(){
        for index in (0...3) {
            buttons[index].setTitle(QuestionController.buttonTexts[index], for: .normal)
        }
    }
    
    @IBAction func answerChoice(_ sender: UIButton) {
        if(sender.titleLabel!.text == QuestionController.usingQuestions[QuestionController.currentQuestionIdx].correct){
            print("correct")
            animateStatus(correct: true)
            QuestionController.score += 1
        }else{
            print("incorrect")
            animateStatus(correct: false)
        }
        QuestionController.currentQuestionIdx += 1
        displayQuestion()
        
        
    }
    
    func animateStatus(correct: Bool){
        if(correct){
            status.text = "Correct"
            status.textColor = .systemGreen
        }else{
            status.text = "Incorrect"
            status.textColor = .systemRed
        }
        doneAnimating = false

        UIView.animate(withDuration: 0.7) {
            self.status.alpha = 1.0
            }
        UIView.animate(withDuration: 0.7, animations: {self.status.alpha = 0.0}, completion: {_ in self.doneAnimating = true})
    }
    
    
    static func resetUI(){
        QuestionController.selectedCategory = Array(TriviaDB.db.keys)[0]
        QuestionController.selectedNumber = 3
        QuestionController.currentQuestionIdx = 0
        QuestionController.buttonTexts = ["A","B","C","D"]
        QuestionController.score = 0
    }
    
}
