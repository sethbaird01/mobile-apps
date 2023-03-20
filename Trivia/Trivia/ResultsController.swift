//
//  ResultsController.swift
//  Trivia
//
//  Created by Baird, Seth J on 3/7/23.
//

import UIKit

class ResultsController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var bigtext: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var categorytext: UILabel!
    
    let progressFloat = (Float) (QuestionController.score/QuestionController.selectedNumber)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(progressFloat >= 0.7){
            image.image = UIImage(systemName: "rosette")
        }else{
            image.image = UIImage(systemName: "xmark.circle")
        }
        bigtext.text = "\(QuestionController.score)/\(QuestionController.selectedNumber)"
        categorytext.text = QuestionController.selectedCategory
    }
    
    override func viewDidAppear(_ animated: Bool) {
        progress.setProgress(progressFloat, animated: true)
    }
    
    @IBAction func resetButton(_ sender: Any) {
        SetupController.selectedNumber = 3
        SetupController.selectedCategory = Array(TriviaDB.db.keys)[0]
        tabBarController?.selectedIndex = 0

    }
    

}
