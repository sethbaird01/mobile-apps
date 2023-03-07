//
//  ResultsController.swift
//  Trivia
//
//  Created by Baird, Seth J on 3/7/23.
//

import UIKit

class ResultsController: UIViewController {
    
    var category: String = ""
    var correct: Int = 0
    var totalQ: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func resetButton(_ sender: Any) {
        SetupController.selectedNumber = 0
        SetupController.selectedCategory = ""
        tabBarController?.selectedIndex = 0
        QuestionController.selectedCategory = ""
        //reset all other QC vars
        category = ""
        correct = 0
        totalQ = 0
    }
    

}
