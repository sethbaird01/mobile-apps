//
//  ViewController.swift
//  Voluntracker
//
//  Created by Baird, Seth J on 1/26/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    var username: String = ""
    var password: String = ""
    

    @IBAction func userText(_ sender: UITextField) {
        username = sender.text ?? ""
    }
    
    @IBAction func passText(_ sender: UITextField) {
        username = sender.text ?? ""
    }
    
    
    
    @IBAction func LogInButton(_ sender: Any) {
        print("login triggered")
    }
    
    @IBAction func UNButton(_ sender: Any) {
    }
    
    @IBAction func PWButton(_ sender: Any) {
    }
}

