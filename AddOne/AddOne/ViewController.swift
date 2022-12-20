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
    
    let startingTimeSec = 120
    var currNum: [Int] = [0, 0, 0, 0]
    var score: Int = 0
    var timeLeftSec: Int = 0
    var timerRun = false
    var timer: Timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetUI((Any).self)
    }
    
    //button directly calls this, maybe bad practice
    @IBAction func resetUI(_ sender: Any) {
        timerRun = false
        timer.invalidate()
        if(score > 1){ //run on manual reset
            alert(timeOut: false)
        }
        currNum = randomArr(length: 4, genRange: (0...9))
        centerLabel.text = "\(currNum[0])\(currNum[1])\(currNum[2])\(currNum[3])" //this could be improved somewhat
        let temp = calcGoal(input: currNum)
        textEntryOut.text = ""
        textEntryOut.placeholder = "\(temp[0])\(temp[1])\(temp[2])\(temp[3])" //this too
        timeLeftSec = startingTimeSec
        score = 0
        moneyLabel.text = "0"
        timeLabel.text = timeFormatted(sec: startingTimeSec)
        symbol.alpha = 0
        symbol.isHidden = true
    }
    
    @IBAction func textEntry(_ sender: Any) {
        guard let entry = textEntryOut?.text else {
            //no valid entry
            return
        }
        
        //start timer if game isnt running yet
        if(!timerRun){
            textEntryOut.placeholder = ""
            timerRun = true
            timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                self.tick()}
        }
        
        if(entry.count == 4){
                //correct entry, move on
            if(parseString(input: entry) == calcGoal(input: currNum)){
                animateSymbol(correct: true)
                score += 1
                moneyLabel.text = "\(score)"
                currNum = calcGoal(input: currNum)
                centerLabel.text = "\(currNum[0])\(currNum[1])\(currNum[2])\(currNum[3])"
            }else{
                //incorrect, go accordingly
                alert(timeOut: false)
                resetUI((Any).self)
            }
            textEntryOut.text = ""
        }
    }
    
    //variable length, string to arr
    func parseString(input: String) -> [Int] {
        var out: [Int] = [Int](repeating: 0, count: input.count)
        var index = 0
        for char in input {
            out[index] = char.wholeNumberValue! //!
            index += 1
        }
        return out
    }
    
    //variable length, finds next number in sequence
    func calcGoal(input: [Int]) -> [Int] {
        var numOut: [Int] = [Int](repeating: 0, count: input.count)
        for idx in 0...input.count-1 {
            var temp = input[idx] + 1
            if(temp == 10){
                temp = 0
            }
            numOut[idx] = temp
        }
        return numOut
    }
    
    func animateSymbol(correct: Bool){
        if(correct){
            symbol.image = UIImage(systemName: "checkmark")
            symbol.tintColor = .systemGreen
        }else{
            symbol.image = UIImage(systemName: "xmark")
            symbol.tintColor = .systemRed
        }
        
        self.symbol.alpha = 1
        self.symbol.isHidden = false;
        UIView.animate(withDuration: 0.7, delay: 0, animations: {
            self.symbol.alpha = 0
            self.symbol.center.y -= 150
        }, completion: {(true) -> Void in
            self.symbol.alpha = 1
            self.symbol.center.y += 150
            self.symbol.isHidden = true
        })
    }
    
    func timeFormatted(sec: Int) -> String{
        //convert seconds to mm:ss
        let min: Int = sec / 60
        let sec: Int = sec % 60
        if(sec == 0){
            return "\(min):00"
        }
        return "\(min):\(sec)"
    }
    
    func alert(timeOut: Bool) {
        //put together dynamic messages
        var message: String = ""
        var timeLeftString: String = ""
        if(timeOut){
            message = "Time Up!"
        }else{
            message = "Game Over"
            timeLeftString = "Time left: \(timeFormatted(sec: timeLeftSec))."
        }
        
        //create and present alert
        let dialogMessage = UIAlertController(title: message, message: "Final Score: \(score). \(timeLeftString)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Reset Game", style: .default, handler: { (action) -> Void in
            return
         })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
        
        //mini-reset for next call
        score = 0
    }
    
    func tick(){
        timeLeftSec -= 1
        //set label with formatted time like 1:45
        timeLabel.text = timeFormatted(sec: timeLeftSec)
        if(timeLeftSec <= 0){
            print("time out")
            timer.invalidate()
        }
    }
    
    func randomArr(length: Int, genRange: ClosedRange<Int>) -> [Int]{
        var temp: [Int] = Array(repeating: 0, count: length)
        for idx in (0...length-1) {
            temp[idx] = Int.random(in: genRange)
        }
        return temp
    }
    
    //ignore this
    func dummy(input: Bool){
        return
    }
    
}

