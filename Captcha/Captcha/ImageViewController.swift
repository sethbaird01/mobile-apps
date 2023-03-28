//
//  ViewController.swift
//  Captcha
//
//  Created by Baird, Seth J on 3/22/23.
//

import UIKit

class ImageViewController: UIViewController {
    
    
    //gen correct captcha
    var correctIdx = Int.random(in: 0...3)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CIViews[0].isUserInteractionEnabled = true
        
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!

        let imagesPath = path+"/Images/"
        var imagesList = try! fm.contentsOfDirectory(atPath: imagesPath)
        
        var chosenImages = Array(Set(Array(repeating: imagesList.randomElement(), count: 4)))
        
        while chosenImages.count < 4 {
            chosenImages.append(imagesList.randomElement())
            //remove duplicates
            chosenImages = Array(Set(chosenImages))
        }
        
        //set images
        var idx = 0;
        for capImage in CIViews {
            capImage.image = UIImage(contentsOfFile: (imagesPath+chosenImages[idx]!))
            idx += 1
        }
        
        //remove extension
        textLabel.text = chosenImages[correctIdx]!.components(separatedBy: ".")[0]
      
    }

    @IBAction func imageButtons(_ sender: UITapGestureRecognizer) {
        print("gesture")
        if((sender.delegate as! CaptchaImageView).tag - 1 == correctIdx){
            print("segue")
            performSegue(withIdentifier: "audio", sender: self)
        }else{
            (sender.delegate as! CaptchaImageView).shake()
        }
    }
    @IBOutlet var CIViews: [CaptchaImageView]!
    @IBOutlet weak var textLabel: UILabel!
    
}


