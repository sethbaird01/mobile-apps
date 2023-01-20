//
//  ViewController.swift
//  TrafficSegues
//
//  Created by Baird, Seth J on 1/20/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var switchOut: UISwitch!
   
    @IBAction func yellowButton(_ sender: Any) {
        if(switchOut.isOn){
            performSegue(withIdentifier: "Yellow", sender: nil)
        }
    }
    
    @IBAction func greenButton(_ sender: Any) {
        if(switchOut.isOn){
            performSegue(withIdentifier: "Green", sender: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
