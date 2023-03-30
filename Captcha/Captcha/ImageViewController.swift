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
                
        //paths
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let imagesPath = path+"/Images/"
        var imagesList = try! fm.contentsOfDirectory(atPath: imagesPath)
        
        //choose 4 images at random
        var chosenImages = Array(Set(Array(repeating: imagesList.randomElement(), count: 4)))
        while chosenImages.count < 4 {
            chosenImages.append(imagesList.randomElement())
            //remove duplicates
            chosenImages = Array(Set(chosenImages))
        }
        
        //set imageviews in storyboard to chosen images
        var idx = 0;
        for capImage in CIViews {
            capImage.image = UIImage(contentsOfFile: (imagesPath+chosenImages[idx]!))
            idx += 1
        }
        
        //remove extension and set label
        textLabel.text = chosenImages[correctIdx]!.components(separatedBy: ".")[0]
    }

    @IBAction func imageButtons(_ sender: UITapGestureRecognizer) {
        //check if selected image was correct
        if((sender.delegate as! CaptchaImageView).tag - 1 == correctIdx){
            //case yes, next page
            performSegue(withIdentifier: "audio", sender: self)
        }else{
            //case no, shake
            (sender.delegate as! CaptchaImageView).shake()
        }
    }
    
    //outlets
    @IBOutlet var CIViews: [CaptchaImageView]!
    @IBOutlet weak var textLabel: UILabel!
    
}


