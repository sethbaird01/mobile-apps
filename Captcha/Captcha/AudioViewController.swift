//
//  AudioViewController.swift
//  Captcha
//
//  Created by Baird, Seth J on 3/24/23.
//

import UIKit

class AudioViewController: UIViewController {

    //gen correct captcha
    var correctIdx = 100
    var correctWord = ""
    var correctPath = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!

        let audioPath = path+"/Sounds/"
        var audioList = try! fm.contentsOfDirectory(atPath: audioPath)
        
        var chosenAudio = Array(Set(Array(repeating: audioList.randomElement(), count: 4)))
        
        while chosenAudio.count < 4 {
            chosenAudio.append(audioList.randomElement())
            //remove duplicates
            chosenAudio = Array(Set(chosenAudio))
        }
        
        correctIdx = Int.random(in: 0...3)
        correctPath = chosenAudio[correctIdx]!!
        correctWord = chosenAudio[correctIdx]!.components(separatedBy: "_")[0]

//        //set labels text
        var idx = 0;
        for curLabel in textCollection {
            //remove trailing text
            curLabel.text = chosenAudio[idx]!.components(separatedBy: "_")[0]
            idx += 1
        }
        
    }
    

    
    @IBAction func labelButtons(_ sender: UITapGestureRecognizer) {
        print("gesture")
        if((sender.delegate as! CaptchaLabel).text == correctWord){
            print("segue")
            performSegue(withIdentifier: "complete", sender: self)
        }else{
            (sender.delegate as! CaptchaImageView).shake()
        }
    }
    @IBOutlet var textCollection: [UILabel]!
    
    @IBAction func playButton(_ sender: Any) {
        let url = Bundle.main.url(forResource: chose, withExtension: "wav")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
    }
}
