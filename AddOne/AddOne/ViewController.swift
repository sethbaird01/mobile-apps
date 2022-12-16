//
//  ViewController.swift
//  AddOne
//
//  Created by Baird, Seth J on 12/14/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moneyLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var centerLabel: UILabel!
    
    @IBOutlet weak var textEntryOut: UITextField!
    
    @IBOutlet weak var symbol: UIImageView!
    
    var currNum: [Int] = [0, 0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetUI((Any).self)
    }

    @IBAction func resetUI(_ sender: Any) {
        //randomize number
        //set number to display
        //empty text field
        //reset time
        //score to zero
        symbol.alpha = 0
    }
    
    @IBAction func textEntry(_ sender: Any) {
        guard let entry = textEntryOut?.text else {
            //no valid entry
            return
        }

        if(entry.count == 4){
            print(entry)
            if(parseString(input: entry) == calcGoal()){
                //animate checkmark fly up and fade

                UIView.animate(withDuration: 0.7, delay: 0.1) {
                    self.symbol.alpha = 0
                    self.symbol.center.y -= 200
                }
                
                //run these after 700ms
//                self.symbol.alpha = 1
//                self.symbol.center.y += 100
                
            }else{
                //game over:
                //alert and ui reset
            }
            textEntryOut.text = ""
        }
    }
    
    func parseString(input: String) -> [Int] {
        var out: [Int] = [0, 0, 0, 0]
        var index = 0
        for char in input {
            out[index] = char.wholeNumberValue!
            index += 1
        }
        return out
    }
    
    func calcGoal() -> [Int] {
        var numOut: [Int] = [0, 0, 0, 0]
        for idx in 0...3 {
            var temp = currNum[idx] + 1
            if(temp == 10){
                temp = 0
            }
            numOut[idx] = temp
        }
        print("goal:  \(numOut)")
        return numOut
    }
    
}

