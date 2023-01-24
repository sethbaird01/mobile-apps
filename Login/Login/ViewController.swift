//
//  ViewController.swift
//  Login
//
//  Created by Baird, Seth J on 1/11/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var username: String = ""
    var password: String = ""

    
    @IBAction func usernameField(_ sender: UITextField) {
        username = sender.text ?? "Home"
    }
    
    @IBAction func passField(_ sender: UITextField) {
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        performSegue(withIdentifier: "login", sender: sender)
    }
    
    @IBAction func forgotUserBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "forgotUserPass", sender: sender)
    }
    
    @IBAction func forgotPassBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "forgotUserPass", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "login"){
            segue.destination.title = username
        }else{
            segue.destination.title = (sender as! UIButton).titleLabel?.text ?? "Default Segue"
        }
    }
}

