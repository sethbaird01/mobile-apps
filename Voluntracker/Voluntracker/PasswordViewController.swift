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
    
    @IBOutlet weak var credsTitle: UILabel!
    
    @IBOutlet weak var credEntry: UITextField!
    
    @IBAction func credEditing(_ sender: Any) {
        password = credEntry.text ?? ""
    }
    
    
    @IBAction func saveButton(_ sender: Any) {
        if(usernameIn.isEmpty){
            //alert
            let dialogMessage = UIAlertController(title: "Save Password", message: "No password entered, please enter one and tap \"Save\" again.", preferredStyle: .alert)
            
            //add button
            let ok = UIAlertAction(title: "Dismiss", style: .default)
            
            dialogMessage.addAction(ok)

            //present alert
            self.present(dialogMessage, animated: true, completion: nil)
        }
        else{
            if(CredentialStore.contains(un: usernameIn)){
                //reset
                CredentialStore.setPassword(un: usernameIn, pw: password)
                }
            else{
                //create
                //MARK: TODO add goal prompt at some point
                var newUser = CredentialStore.User(username: usernameIn, password: password, hours: 0, goal: 0)
                CredentialStore.storeUser(u: newUser)
            }
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        credsTitle.text = "Enter new password for \(usernameIn)"
        
        
    }
    

}
