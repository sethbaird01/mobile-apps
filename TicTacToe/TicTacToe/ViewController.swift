//
//  ViewController.swift
//  TicTacToe
//
//  Created by Baird, Seth J on 10/4/22.
//

import UIKit

class ViewController: UIViewController {

    var state: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    //0 is blank
    //1 is x
    //2 is o
    
    var complete: Bool = false
    var turnsPlayed = 0
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet var outlets: [UIButton]!
    @IBAction func actions(_ sender: UIButton) {
        if(!complete){
            turnsPlayed += 1
            print("current label text = \(String(describing: turnLabel?.text))")
            
            state[sender.tag - 1] = getCurrentTurn()
            print("tag-1 = \(sender.tag-1)")
            outlets[sender.tag - 1].setTitle("\(getCurrentTurn())", for: .normal)
            if(turnsPlayed >= 3 && checkWin()){
                turnLabel.text = "\(getCurrentTurn()) won!"
                complete = true;
            }else{
                toggleTurns()
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO
        //set all tile strings to empty on game start
        //redo line 28 tile text
    }
    
    func toggleTurns() {
        if(String(describing: turnLabel.text) == "Optional(\"Turn: X\")"){
            turnLabel.text = "Turn: O"
        }else
        if(String(describing: turnLabel.text) == "Optional(\"Turn: O\")"){
            turnLabel.text = "Turn: X"
        }
    }
    
    func getCurrentTurn() -> Int{
        if(String(describing: turnLabel.text) == "Optional(\"Turn: X\")"){
            return 1
        }
        if(String(describing: turnLabel.text) == "Optional(\"Turn: O\")"){
            return 2
        }
        return 0
    }
    
    func checkWin() -> Bool{
        //vertical
        for add in 0...2 {
            if(state[0+add] == state[3+add] && state[3+add] == state[6+add] && state[3+add] != 0){
                return true;
            }
        }

        //horizontal
        for add in 0...2 {
            if(state[0+add] == state[1+add] && state[1+add] == state[2+add] && state[1+add] != 0){
                return true;
            }
        }

        //diagonal L-R
        if(state[0] == state[4] && state[4] == state[8] && state[4] != 0){
            return true;
        }

        //diagonal R-L
        if(state[2] == state[4] && state[4] == state[6] && state[4] != 0){
            return true;
        }

        return false;
    }


}
