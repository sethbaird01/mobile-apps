//
//  ViewController.swift
//  Light
//
//  Created by Baird, Seth J on 8/25/22.
//

import UIKit

class ViewController: UIViewController {

    //outlets provide access to the app's ui elements
    @IBOutlet weak var button: UIButton!
    @IBOutlet var background: UIView!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var text: UILabel!
    
    //this keeps track of the state (rich, poor)
    var swapped = false
    
    @IBAction func buttonPress(_ sender: Any) {
        //runs opposite state on button press
        swapped ? goRich() : goPoor()
    }
    
    func goPoor() {
        //changes all ui elements to "poor"
        image.image = UIImage.init(named: "Rock")
        background.backgroundColor = .systemBrown
        text.text = "I have no money"
        text.font = UIFont.systemFont(ofSize: 26, weight: .thin)
        
        //animates the imageview
        UIView.animate(withDuration: 1, delay: 0.5) {
            self.image.frame.size.width -= 20
            self.image.center.x += 10
            self.image.frame.size.height -= 20
            self.image.center.y += 10
        }
        
        //update state variable
        swapped.toggle()
    }
    
    func goRich() {
        //changes all ui elements to "rich"
        image.image = UIImage.init(named: "Diamond")
        background.backgroundColor = .systemIndigo
        text.text = "I Am Rich"
        text.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        
        //animates the imageview
        UIView.animate(withDuration: 1, delay: 0.5) {
            self.image.frame.size.width += 20
            self.image.center.x -= 10
            self.image.frame.size.height += 20
            self.image.center.y -= 10
        }
    
        //update state variabe
        swapped.toggle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initial state will show rich
        goRich()
    }

}

