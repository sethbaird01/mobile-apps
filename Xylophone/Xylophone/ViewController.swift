//
//  ViewController.swift
//  Xylophone
//
//  Created by Baird, Seth J on 11/1/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    @IBAction func playSound(_ sender: UIButton) {
            var note = ""
        switch sender.tag {
        case 0:
            note = "A"
        case 1:
            note = "B"
        case 2:
            note = "C"
        case 3:
            note = "D"
        case 4:
            note = "E"
        case 5:
            note = "F"
        case 6:
            note = "G"
        default:
            print("tag exception")
        }
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
                player = try! AVAudioPlayer(contentsOf: url!)
                player.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
