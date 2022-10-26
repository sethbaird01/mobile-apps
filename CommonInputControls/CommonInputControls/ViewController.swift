//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Baird, Seth J on 10/26/22.
//

import UIKit

class ViewController: UIViewController {
    //not organizing this
    @IBAction func gestureTap(_ sender: UIGestureRecognizer) {
        print(sender.location(in: view))
    }
    @IBOutlet weak var label: UILabel!
    @IBAction func `switch`(_ sender: UISwitch) {
        if sender.isOn {
                print("switch is on")
            } else {
                print("switch is off")
            }

    }
    @IBAction func buttonTapped(_ sender: Any) {
        print("button")
    }
    
    @IBAction func slider(_ sender: UISlider) {
        print(sender.value)
    }
    @IBAction func textReturn(_ sender: UITextField) {
        print(sender.text!)
        label.text = sender.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

