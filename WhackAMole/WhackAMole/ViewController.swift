import UIKit

class ViewController: UIViewController {
    
    //init all elements and vars
    var playField = UILabel()
    var score: Int = 0
    var scoreLabel = UILabel()
    var timerLabel = UILabel()
    var timer = Timer()
    var time = 3;
    var mole = UIButton()
    var gameStarted = false //first button press
    var gameRunning = true //game over or not
    
    let screenWidth  = Int(UIScreen.main.bounds.width)
    let screenHeight = Int(UIScreen.main.bounds.height)
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        //minimum dimensions, essentially
        let marginWidth = Int(Double(screenWidth)*0.1)
        let marginHeight = Int(Double(screenHeight)*0.1)
        
        
        // playfield
        playField.frame = CGRect(x: marginWidth, y: marginHeight*2, width: screenWidth-(marginWidth*2), height: screenHeight-(marginHeight*3))
        playField.backgroundColor = UIColor.systemGreen
        playField.text = "Tap to Start"
        playField.textAlignment = .center
        
        //score
        scoreLabel.frame = CGRect(x: marginWidth, y: marginHeight, width: screenWidth-(marginWidth*2), height: marginHeight)
        scoreLabel.text = "0"
        scoreLabel.textAlignment = NSTextAlignment.center
        
        //mole
        mole.frame = CGRect(x: marginWidth, y: marginHeight*2, width: marginWidth, height: marginWidth)
        mole.backgroundColor = .brown
        mole.addTarget(self, action:#selector(self.whack), for: .touchUpInside)
        mole.setTitle("!!!", for: .normal)
        
        //timer and indicator
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        //timer fires every second (will come to use later)
        timerLabel.frame = CGRect(x: marginWidth, y: marginHeight+(marginWidth/2), width: marginWidth, height: marginWidth)
        timerLabel.textAlignment = .center

        
        //add elements to view
        view.addSubview(playField)
        view.addSubview(scoreLabel)
        view.addSubview(mole)
        view.addSubview(timerLabel)
    }
    
    @objc func timerFunction(_ sender: UIButton!) {
        //make sure user started the game but has also not lost yet
        if(gameRunning && gameStarted){
            //update timer box
            timerLabel.text = "\(time)"
        switch time {
            //set color of timer box according to time remaining , also text
            case 3:
                timerLabel.backgroundColor = .green
            case 2:
                timerLabel.backgroundColor = .yellow
            case 1:
                timerLabel.backgroundColor = .red
            case 0:
                timerLabel.backgroundColor = .black
                time = 3
                
            //out of time !
                gameOver()
        default:
            print("timerstate error")
        }
        time -= 1;
            
        }
    }
    
    @objc func whack(_ sender: UIButton){
       //make sure game isnt lost
        if(gameRunning){
            if(!gameStarted){
                //make sure user started the game, change ui elements as needed
                gameStarted = true
                mole.setTitle("", for: .normal)
                playField.text = ""
            }
            score += 1
            
            //gets harder with score
            //with greater score, time limit is decreased
            switch score {
            case 0...7:
                time = 3
            case 8...16:
                time = 2
            default:
                //values above score=16 only get one second
                time = 1
            }
            scoreLabel.text = "Score: \(score)"

            //these cant be in superscore since self would not yet be defined
            let marginWidth = Int(Double(screenWidth)*0.1)
            let marginHeight = Int(Double(screenHeight)*0.1)
            
            //move mole within bounds
            sender.frame = CGRect(x: Int.random(in: marginWidth...(screenWidth-(marginWidth)*2)), y: Int.random(in: marginHeight*2...(screenHeight-(marginHeight)*2)), width: marginWidth, height: marginWidth)
        }
    }
    
    func gameOver(){
        //change ui elements to reflect new gamestate
        //couldve used another view probably but we havent done that yet
        gameRunning = false
        mole.backgroundColor = .none
        mole.setTitle("", for: .normal)
        playField.text = "Game over!"
        scoreLabel.text = "Final score: \(score)"
        scoreLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        timerLabel.font = UIFont.systemFont(ofSize: 10)
        timerLabel.textColor = .white
        timerLabel.numberOfLines = 0; //allows linebreak
        timerLabel.text = "Time\nOut"
        playField.backgroundColor = .lightGray
    }
    
    
}
