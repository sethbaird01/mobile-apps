//
//  ViewController.swift
//  Squares
//
//  Created by Baird, Seth J on 11/17/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for x in (1...42){
            self.view.addSubview(Square.init(frame: CGRect(x: Int.random(in: 0...7*x), y: Int.random(in: 0...7*x), width: 50, height: 50)))
        }
    }
}
