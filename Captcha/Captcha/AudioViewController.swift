//
//  AudioViewController.swift
//  Captcha
//
//  Created by Baird, Seth J on 3/24/23.
//

import UIKit

class AudioViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!

        let soundsPath = "\(path)+/Sounds"
        let soundsList =  try! fm.contentsOfDirectory(atPath: soundsPath)
        

        
        //set labels to na

    }
    

    
    @IBAction func labelButtons(_ sender: UITapGestureRecognizer) {
        var selectedTextIndex = sender.view!.tag - 5
    }
    @IBOutlet var textCollection: [UILabel]!
    
    @IBAction func playButton(_ sender: Any) {
    }
}
