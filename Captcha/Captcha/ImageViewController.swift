//
//  ViewController.swift
//  Captcha
//
//  Created by Baird, Seth J on 3/22/23.
//

import UIKit

class ImageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!

        let imagesPath = "\(path)+/Images"
        var imagesList = try! fm.contentsOfDirectory(atPath: imagesPath)
        
        var chosenImages = Array(repeating: imagesList.randomElement(), count: 4)
        
        while chosenImages.count < 4 {
            chosenImages.append(imagesList.randomElement())
            //remove duplicates
            chosenImages = Array(Set(chosenImages))
        }
        
        //set images
        var idx = 0;
        for capImage in CIViews {
            capImage.image = UIImage(contentsOfFile: (URL(string: imagesPath)?.appending(path: chosenImages[idx]!))!)
            idx++
        }
      
    }

    @IBAction func imageButtons(_ sender: Any) {
        
    }
    @IBOutlet var CIViews: [CaptchaImageView]!
    @IBOutlet weak var textLabel: UILabel!
    
}


