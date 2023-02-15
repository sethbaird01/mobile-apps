//
//  ForgotViewController.swift
//  Voluntracker
//
//  Created by Baird, Seth J on 2/7/23.
//

import UIKit

class PasswordViewController: UIViewController {
    
    var usernameIn = ""
    var defaults: UserDefaults? = nil //written on segue prepare()
    
    var password: String = ""
    var goalMode = false
    
    @IBOutlet weak var credsTitle: UILabel!
    
    @IBOutlet weak var credEntry: UITextField!
    
    @IBAction func credEditing(_ sender: Any) {
        password = credEntry.text ?? ""
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        if(usernameIn.isEmpty){
            //input validation
            let dialogMessage = UIAlertController(title: "Save Password", message: "No password entered, please enter one and tap \"Save\" again.", preferredStyle: .alert)
            
            let ok = UIAlertAction(title: "Dismiss", style: .default)
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
        else{
            if(goalMode){
                //if account is newly created and needs to set a goal
                do {
                    guard let newGoal =  Int(password) else{
                        //input validation
                        let dialogMessage = UIAlertController(title: "Invalid Goal Entered", message: "Please enter a numerical goal in the text field", preferredStyle: .alert)
                        
                        let ok = UIAlertAction(title: "Dismiss", style: .default)
                        dialogMessage.addAction(ok)
                        self.present(dialogMessage, animated: true, completion: nil)
                        
                        credEntry.text = ""
                        password = ""
                        //go to unwind
                        return
                    }
                    
                    //edge case, account not created succesfully so goal can't be set
                    _ = try CredentialStore.setGoal(un: usernameIn, newGoal: newGoal).get()
                } catch _ {
                    let dialogMessage = UIAlertController(title: "Error!", message: "No account was found with this username even after new credential creation", preferredStyle: .alert)
                    
                    let ok = UIAlertAction(title: "Dismiss", style: .default)
                    dialogMessage.addAction(ok)
                    self.present(dialogMessage, animated: true, completion: nil)
                }
                navigationController?.popToRootViewController(animated: true)
                return
            } else{
                //reset password case
                if(CredentialStore.contains(un: usernameIn)){
                    //input validation and fn call
                    do {
                        _ = try CredentialStore.setPassword(un: usernameIn, pw: password).get()
                        navigationController?.popToRootViewController(animated: true)
                        return
                    } catch _ {
                            let dialogMessage = UIAlertController(title: "Account not found", message: "No account was made with this username, enter a valid username and try again.", preferredStyle: .alert)
                        
                        let ok = UIAlertAction(title: "Dismiss", style: .default)
                        dialogMessage.addAction(ok)
                            self.present(dialogMessage, animated: true, completion: nil)
                    }
                }
                else{
                    //create account
                    //input already validated in past vc
                    let newUser = CredentialStore.User(username: usernameIn, password: password, hours: 0, goal: 0)
                    CredentialStore.storeUser(u: newUser)
                    
                    //change page layout to goal setter, expecting if-tree to run again
                    title = "Set Goal Amount"
                    credsTitle.text = "Set a goal (hours) below"
                    credEntry.placeholder = "5"
                    credEntry.text = ""
                    password = ""
                    credEntry.keyboardType = .numberPad
                    credEntry.isSecureTextEntry = false
                    goalMode = true
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //reset goalmode if already set
        goalMode = false
        credEntry.keyboardType = .default
        credEntry.isSecureTextEntry = true
        credsTitle.text = "Enter new password for \(usernameIn)"
    }
    

}
