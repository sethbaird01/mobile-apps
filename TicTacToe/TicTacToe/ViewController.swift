//
//  ViewController.swift
//  TicTacToe
//
//  Created by Baird, Seth J on 10/4/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var outletCollection: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        outletCollection[0].titleLabel?.text = "testOne"
    }


}

