//
//  ViewController.swift
//  RGBMatcher
//
//  Created by Baird, Seth J on 10/28/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var leftView: UIView!
    @IBOutlet weak var rightView: UIView!
    @IBOutlet var sliderCollection: [UISlider]!
    
    var gameStarted: Bool = false;
    var timer: Timer = Timer()
    var goalColor: UIColor = .white
    var userColor: UIColor = .white
    var time = 8

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        //border views
        leftView.layer.borderWidth = 2
        rightView.layer.borderWidth = 2
        
        //reset slider set value
        for slider in sliderCollection {
            slider.value = 1.0;
        }
        
        //generate and set colors
        userColor = .white
        goalColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        
        //set view color
        leftView.backgroundColor = userColor
        rightView.backgroundColor = goalColor
        
        //label text
        timeLabel.text = "Timer paused"
    }
    
    @IBAction func sliderActions(_ sender: UISlider) {
        if(!gameStarted){
            //start game and make new timer
            gameStarted = true
            time = 8
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.tick()}
        }
        //find which slider is which then set userColor to the combined value
        var userRed = Float()
        var userGreen = Float()
        var userBlue = Float()
        for slider in sliderCollection {
            switch slider.tag {
            case 0:
                userRed = slider.value
            case 1:
                userGreen = slider.value
            case 2:
                userBlue = slider.value
            default:
                print("tag error")
            }
        }
        userColor = UIColor(red: CGFloat(userRed), green: CGFloat(userGreen), blue: CGFloat(userBlue), alpha: 1)
        
        //set view color
        leftView.backgroundColor = userColor
    }
    
    func tick() {
//        print("tick")
        //decrement time and update label every 1s
        time -= 1
        timeLabel.text = "Time left: \(time)"
        
        //end game when time out
        if(time == 0){
            endGame()
        }
    }
    
    func endGame(){
        //stop timer and end game
        timer.invalidate()
        timeLabel.text = "No time!"
        gameStarted = false
        
        //calculate linear distance
        var userRed = CGFloat(), userGreen = CGFloat(), userBlue = CGFloat(), goalRed = CGFloat(), goalGreen = CGFloat(), goalBlue = CGFloat()
        userColor.getRed(&userRed, green: &userGreen, blue: &userBlue, alpha: nil)
        goalColor.getRed(&goalRed, green: &goalGreen, blue: &goalBlue, alpha: nil)
        let score = Int((1 - sqrt(pow(userRed-goalRed, 2) + pow(userGreen-goalGreen, 2) + pow(userBlue-goalBlue, 2)))*100)
        
        //create and present alert
        let dialogMessage = UIAlertController(title: "Time Up", message: "Score: \(score)", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Reset Game", style: .default, handler: { (action) -> Void in
            self.initUI()
         })
        dialogMessage.addAction(ok)
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
}

