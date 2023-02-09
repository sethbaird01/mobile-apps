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
        CredentialStore.printAllUsers()
    }

    var username: String = ""
    var password: String = ""
    var logInUser: CredentialStore.User? = nil //set upon login
    
    @IBOutlet weak var userOutlet: UITextField!
    @IBOutlet weak var passOutlet: UITextField!
        
    @IBAction func userText(_ sender: UITextField) {
        username = sender.text ?? ""
    }
    
    @IBAction func passText(_ sender: UITextField) {
        password = sender.text ?? ""
    }
    
    @IBAction func LogInButton(_ sender: Any) {
        let capturedPW: String = password
        let capturedUN: String = username
        
        do {
            logInUser = try CredentialStore.getUser(un: capturedUN).get()
            }
            catch _ {
            print("invalid username")
                //alert
                let dialogMessage = UIAlertController(title: "Username not found", message: "No account was made with this username, enter the correct one or tap \"Sign Up\" to create a new account.", preferredStyle: .alert)
                
                //add button
                let ok = UIAlertAction(title: "Dismiss", style: .default)
                
                dialogMessage.addAction(ok)

                //present alert
                self.present(dialogMessage, animated: true, completion: nil)
        }
        if(capturedPW == logInUser?.password){
            performSegue(withIdentifier: "login", sender: self)
        }else{
            //alert
            let dialogMessage = UIAlertController(title: "Incorrect Password", message: "Please enter the correct credentials or tap \"Forgot Password\" to reset it.", preferredStyle: .alert)
            
            //add button
            let ok = UIAlertAction(title: "Dismiss", style: .default)
            
            dialogMessage.addAction(ok)

            //present alert
            self.present(dialogMessage, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        if(username.isEmpty){
            //alert
            let dialogMessage = UIAlertController(title: "Create Account", message: "No username entered, make up a username to continue and tap \"Sign Up\" again.", preferredStyle: .alert)
            
            //add button
            let ok = UIAlertAction(title: "Dismiss", style: .default)
            
            dialogMessage.addAction(ok)

            //present alert
            self.present(dialogMessage, animated: true, completion: nil)
        }
        else{
                performSegue(withIdentifier: "create", sender: self)
            }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "create" || segue.identifier == "forgotPass"
        {
            if let destinationVC = segue.destination as? PasswordViewController {
                print("segue preparation")
                destinationVC.usernameIn = username
                destinationVC.defaults = UserDefaults.standard
                destinationVC.title = (segue.identifier == "create") ? "Create Account" : "Forgot Password"
            }
        }
        if segue.identifier == "login"
        {
            if let destinationVC = segue.destination as? LoginViewController {
                destinationVC.activeUser = logInUser!
                destinationVC.defaults = UserDefaults.standard
                destinationVC.title = "Welcome, \(username)"
            }
        }
    }
    
    @IBAction func PWButton(_ sender: Any) {
        if(username.isEmpty){
            //alert
            let dialogMessage = UIAlertController(title: "Reset Password", message: "No username entered, type in your username and tap \"Forgot Password\" again.", preferredStyle: .alert)
            
            //add button
            let ok = UIAlertAction(title: "Dismiss", style: .default)
            
            dialogMessage.addAction(ok)

            //present alert
            self.present(dialogMessage, animated: true, completion: nil)
        } else if CredentialStore.contains(un: username){
            //alert
            let dialogMessage = UIAlertController(title: "Reset Password", message: "No account found under this username, please type in a valid username and tap \"Forgot Password\" again.", preferredStyle: .alert)
            
            //add button
            let ok = UIAlertAction(title: "Dismiss", style: .default)
            
            dialogMessage.addAction(ok)

            //present alert
            self.present(dialogMessage, animated: true, completion: nil)
        }
        else{
                performSegue(withIdentifier: "forgotPass", sender: self)
            }
    }
    
    
}

