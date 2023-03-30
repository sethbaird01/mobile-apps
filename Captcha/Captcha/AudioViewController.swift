//
//  AudioViewController.swift
//  Captcha
//
//  Created by Baird, Seth J on 3/24/23.
//

import UIKit
import AVFoundation

class AudioViewController: UIViewController {

    //instance variables
    var correctIdx = 100
    var correctWord = ""
    var correctPath = ""
    
    //audioplayer
    var player: AVAudioPlayer!
    var audioPath = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //paths
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        audioPath = path+"/Sounds/"
        let audioList = try! fm.contentsOfDirectory(atPath: audioPath)
    
        //choose random audio files
        var chosenAudios = Array(Set(Array(repeating: audioList.randomElement(), count: 4)))
        
        //remove duplicates and fill array
        while chosenAudios.count < 4 {
            chosenAudios.append(audioList.randomElement())
            chosenAudios = Array(Set(chosenAudios))
        }
        
        //set instane vars
        correctIdx = Int.random(in: 0...3)
        correctPath = chosenAudios[correctIdx]!
        correctWord = chosenAudios[correctIdx]!.components(separatedBy: "_")[1].components(separatedBy: ".")[0]

        //set labels text
        var idx = 0;
        for curLabel in textCollection {
            //remove trailing text
            curLabel.text = chosenAudios[idx]!.components(separatedBy: "_")[1].components(separatedBy: ".")[0]
            idx += 1
        }
        
    }
    

    
    @IBAction func labelButtons(_ sender: UITapGestureRecognizer) {
        //check if selected text matches audio
        if((sender.delegate as! CaptchaLabel).text!.lowercased() == correctWord.lowercased()){
            //case yes, next page
            performSegue(withIdentifier: "complete", sender: self)
        }else{
            //case no, shake
            (sender.delegate as! CaptchaLabel).shake()
        }
    }
    
    //outlet
    @IBOutlet var textCollection: [UILabel]!
    
    //sound handler
    @IBAction func playButton(_ sender: Any) {
        let url = URL(string: (audioPath+correctPath))
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
    }
}
