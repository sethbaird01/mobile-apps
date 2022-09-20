//
//  ViewController.swift
//  Destiny
//
//  Created by Baird, Seth J on 9/14/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewOut: UIView!
    @IBOutlet weak var roomInfo: UILabel!
    @IBOutlet weak var choice1Out: UIButton!
    @IBOutlet weak var choice2Out: UIButton!
    @IBOutlet weak var imageOut: UIImageView!
    
    var game = Destiny()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView(){
        if(game.currentStory != -1){
            roomInfo.text = game.currTitle()
            choice1Out.setTitle(game.currChoices()[0], for: .normal)
            choice2Out.setTitle(game.currChoices()[1], for: .normal)
            

            print("current index \(game.currentStory)")

            UIView.transition(with: self.imageOut, duration:1,
              options: UIView.AnimationOptions.transitionCrossDissolve, animations: { self.imageOut.image = UIImage.init(named: self.game.currImage()) })
        }
    }

    @IBAction func choice1Action(_ sender: Any) {
        game.advanceTo(choiceNum: 1)
        updateView()
    }
    
    @IBAction func choice2Action(_ sender: Any) {
        game.advanceTo(choiceNum: 2)
        updateView()
    }
}

