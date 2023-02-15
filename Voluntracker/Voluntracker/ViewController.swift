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
        //show all users for clarity
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
        //saves credentials so if text fields change it will still be saved
        let capturedPW: String = password
        let capturedUN: String = username
        passOutlet.text = ""
        
        //checks credentials and sends alert if it's not correct
        //performs segue if valid
        do {
            logInUser = try CredentialStore.getUser(un: capturedUN).get()
            }
            catch _ {
            print("invalid username")
                userOutlet.text = ""
                    let dialogMessage = UIAlertController(title: "Username not found", message: "No account was made with this username, enter the correct one or tap \"Sign Up\" to create a new account.", preferredStyle: .alert)
                
                    let ok = UIAlertAction(title: "Dismiss", style: .default)
                
                dialogMessage.addAction(ok)

                    self.present(dialogMessage, animated: true, completion: nil)
        }
        if(capturedPW == logInUser?.password){
            userOutlet.text = ""
            performSegue(withIdentifier: "login", sender: self)
        }else{
            let dialogMessage = UIAlertController(title: "Incorrect Password", message: "Please enter the correct credentials or tap \"Forgot Password\" to reset it.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Dismiss", style: .default)
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        //uses username field to decide which user to create , validates input here
        if(username.isEmpty){
            let dialogMessage = UIAlertController(title: "Create Account", message: "No username entered, make up a username to continue and tap \"Sign Up\" again.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Dismiss", style: .default)
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
        else{
            //checks other case where account already exists
            if(CredentialStore.contains(un: username)){
                    let dialogMessage = UIAlertController(title: "Create Account", message: "Username already in use. Please enter a new username and try again.", preferredStyle: .alert)
                
                    let ok = UIAlertAction(title: "Dismiss", style: .default)
                
                dialogMessage.addAction(ok)

                    self.present(dialogMessage, animated: true, completion: nil)
            }else{
                //finally performs segue if username is unique
                performSegue(withIdentifier: "create", sender: self)
            }
            }
    }
    
    //segue preparation sends necessary information to next vc
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
        //forgot password input validation
        if(username.isEmpty){
            let dialogMessage = UIAlertController(title: "Reset Password", message: "No username entered, type in your username and tap \"Forgot Password\" again.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Dismiss", style: .default)
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
            //case where accout doesn't exist
        } else if !CredentialStore.contains(un: username){
            let dialogMessage = UIAlertController(title: "Reset Password", message: "No account found under this username, please type in a valid username and tap \"Forgot Password\" again.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Dismiss", style: .default)
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
        else{
            //perform segue is username is ok
                performSegue(withIdentifier: "forgotPass", sender: self)
            }
    }
    
}

