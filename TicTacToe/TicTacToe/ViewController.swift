//
//  ViewController.swift
//  TicTacToe
//
//  Created by Baird, Seth J on 10/4/22.
//

import UIKit

class ViewController: UIViewController {
    
    //decided to track state with strings for easier printing
    var state: [String] = ["", "", "", "", "", "", "", "", ""]
    
    var complete: Bool = false
    var turnsPlayed = 0
    var timer: Timer = Timer()
    
    //set in viewDidLoad
    var defaultFont: UIFont = UIFont()
    
    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet var outlets: [UIButton]!
    
    @IBAction func actions(_ sender: UIButton) {
        if(!complete && state[sender.tag - 1] == ""){
            turnsPlayed += 1 //track turns played
            
            //selected tile taken indication
            state[sender.tag - 1] = getCurrentTurn()
            
            //set button labels
            outlets[sender.tag - 1].setTitle(getCurrentTurn(), for: .normal)
            outlets[sender.tag - 1].titleLabel?.font = defaultFont
            
            //check wincon after 3 plays to avoid wasted computation
            if(turnsPlayed >= 3 && checkWin()){
                turnLabel.text = "\(getCurrentTurn()) won!"
                complete = true;
                //disable interaction so touch animation isnt played
                for btn in outlets {
                    btn.isUserInteractionEnabled = false
                }
                activity.startAnimating()
                timer = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true) { timer in
                    self.resetUI()}
                
            }else{
                //or just continue game
                toggleTurns()
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //save big font for later
        defaultFont = outlets[0].titleLabel?.font ?? UIFont()
        //remove numbers for gameplay
        for btn in outlets {
            btn.setTitle("", for: .normal)
        }
    }
    
    func toggleTurns() {
        if(String(describing: turnLabel.text) == "Optional(\"Turn: ❌\")"){
            turnLabel.text = "Turn: ⭕️"
        }else
        if(String(describing: turnLabel.text) == "Optional(\"Turn: ⭕️\")"){
            turnLabel.text = "Turn: ❌"
        }
    }
    
    func getCurrentTurn() -> String{
        if(String(describing: turnLabel.text) == "Optional(\"Turn: ❌\")"){
            return "❌"
        }
        if(String(describing: turnLabel.text) == "Optional(\"Turn: ⭕️\")"){
            return "⭕️"
        }
        print("State error")
        return "err"
    }
    
    func checkWin() -> Bool{
        //vertical
        for add in 0...2 {
            if(state[0+add] == state[3+add] && state[3+add] == state[6+add] && state[3+add] != ""){
                
                outlets[0+add].backgroundColor = .systemRed
                outlets[3+add].backgroundColor = .systemRed
                outlets[6+add].backgroundColor = .systemRed
                return true;
            }
        }
        
        //horizontal
        for add in stride(from: 0, to: 9, by: 3) {
            //stride is the best thing
            if(state[0+add] == state[1+add] && state[1+add] == state[2+add] && state[1+add] != ""){
                
                outlets[0+add].backgroundColor = .systemRed
                outlets[1+add].backgroundColor = .systemRed
                outlets[2+add].backgroundColor = .systemRed
                return true;
            }
        }
        
        //diagonal L-R
        if(state[0] == state[4] && state[4] == state[8] && state[4] != ""){
            
            outlets[0].backgroundColor = .systemRed
            outlets[4].backgroundColor = .systemRed
            outlets[8].backgroundColor = .systemRed
            return true;
        }
        
        //diagonal R-L
        if(state[2] == state[4] && state[4] == state[6] && state[4] != ""){
            
            outlets[2].backgroundColor = .systemRed
            outlets[4].backgroundColor = .systemRed
            outlets[6].backgroundColor = .systemRed
            return true;
        }
        
        return false;
    }
    
    func resetUI() {
        //reset all ui elements to default after timer fire
        for btn in outlets {
            btn.isUserInteractionEnabled = true
            btn.setTitle("", for: .normal)
            btn.backgroundColor = .systemGray5
        }
        turnLabel.text = "Turn: ❌"
        complete = false;
        turnsPlayed = 0
        state = ["", "", "", "", "", "", "", "", ""]
        activity.stopAnimating()
        timer.invalidate()
    }


}
