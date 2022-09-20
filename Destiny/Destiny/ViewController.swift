//
//  ViewController.swift
//  Destiny
//
//  Created by Baird, Seth J on 9/14/22.
//

import UIKit

class ViewController: UIViewController {

    //outlets for UI elements
    @IBOutlet var viewOut: UIView!
    @IBOutlet weak var roomInfo: UILabel!
    @IBOutlet weak var choice1Out: UIButton!
    @IBOutlet weak var choice2Out: UIButton!
    @IBOutlet weak var imageOut: UIImageView!
    
    //game init
    var game = Destiny()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //this func handles all ui updates
        updateView()
    }
    
    func updateView(){
        //first check for valid game index
        if(game.currentStory != -1){
        //change essential text elements
            roomInfo.text = game.currTitle()
            choice1Out.setTitle(game.currChoices()[0], for: .normal)
            choice2Out.setTitle(game.currChoices()[1], for: .normal)
            
            print("current index \(game.currentStory)")
            //fade into new image
            UIView.transition(with: self.imageOut, duration:1,
              options: UIView.AnimationOptions.transitionCrossDissolve, animations: { self.imageOut.image = UIImage.init(named: self.game.currImage()) })
        }
    }

    //button handler functions calling advanceTo()
    @IBAction func choice1Action(_ sender: Any) {
        game.advanceTo(choiceNum: 1)
        updateView()
    }
    
    @IBAction func choice2Action(_ sender: Any) {
        game.advanceTo(choiceNum: 2)
        updateView()
    }
}

