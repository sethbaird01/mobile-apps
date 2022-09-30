//
//  ViewController.swift
//  Magic8Ball
//
//  Created by Baird, Seth J on 9/22/22.
//

import UIKit

class ViewController: UIViewController {

    //outlet declaration
    @IBOutlet weak var labelOut: UILabel!
    @IBOutlet weak var thinkOut: UILabel!
    @IBOutlet weak var imageOut: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let responses: [String] = ["Yes","No","Maybe so", "Certainly", "Without a doubt", "Doubtful"]
    //empty label state
    let empty: String = "                                                 "
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
           if motion == .motionShake {
               //add text
               labelOut.text = responses[Int.random(in: 0...responses.count-1)]
               print("text: \(labelOut.text ?? "unknown")")

               //fade into new image
               UIView.transition(with: self.imageOut, duration:1,
                 options: UIView.AnimationOptions.transitionCrossDissolve, animations: { self.imageOut.image = UIImage.init(named: "8blue") })
               
               //fade labels
               UIView.transition(with: self.thinkOut, duration:1,
                                 options: UIView.AnimationOptions.transitionCrossDissolve, animations: { self.thinkOut.alpha = 0 })
               UIView.transition(with: self.labelOut, duration:1,
                                 options: UIView.AnimationOptions.transitionCrossDissolve, animations: { self.labelOut.alpha = 1 })
               
               //reset timer
               timer = Timer.scheduledTimer(withTimeInterval: 4.0, repeats: true) { timer in
                   self.resetUI()
               }
           }
        }
    
    //public scope
    var timer: Timer = Timer()
    
    //bring back faded elements
    func resetUI(){
        //image fade
        UIView.transition(with: self.imageOut, duration:1,
          options: UIView.AnimationOptions.transitionCrossDissolve, animations: { self.imageOut.image = UIImage.init(named: "8square") })
        
        //text fade
        UIView.transition(with: self.thinkOut, duration:1,
                          options: UIView.AnimationOptions.transitionCrossDissolve, animations: { self.thinkOut.alpha = 1 })
        UIView.transition(with: self.labelOut, duration:1,
                          options: UIView.AnimationOptions.transitionCrossDissolve, animations: { self.labelOut.alpha = 0 })
        //remove text while its invisible
        labelOut.text = empty
        
        //remove timer so it doesnt keep running
        timer.invalidate()
    }

}//
