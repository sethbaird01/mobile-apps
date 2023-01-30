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
    
    @IBOutlet weak var userOutlet: UITextField!
    @IBOutlet weak var passOutlet: UITextField!
    
    @IBAction func userText(_ sender: UITextField) {
        username = sender.text ?? ""
    }
    
    @IBAction func passText(_ sender: UITextField) {
        username = sender.text ?? ""
    }
    
    @IBAction func LogInButton(_ sender: Any) {
        let capturedPW: String = password
        let capturedUN: String = username
        
        let activeUser: User = nil
        print("login triggered")
        do {
            activeUser = try getUser(un: capturedUN).get()
            }
            catch _ {
            print("invalid username")
                //prompt to create account with these credentials or cancel
        }
        if(capturedPW = activeUser.password){
            
        }
        
    }
    
    @IBAction func UNButton(_ sender: Any) {
        
    }
    
    @IBAction func PWButton(_ sender: Any) {
    }
    
    struct User: Codable {
        let username, password: String
        let hours, goal: Int
    }

    func storeUser(u: User) -> (){
        do {
            let data = try JSONEncoder().encode(u)
            UserDefaults.standard.set(data, forKey: u.username)
            print("Stored element with username \(u.username)")
        } catch let error {
            print("JSON error \(error) on username \(u.username)")
        }
    }
    
    func getUser(un: String) -> Result<User, Error>{
        do {
            let data = try JSONDecoder().decode(User.self, from: UserDefaults.standard.data(forKey: un) ?? Data())
            print("Got element with username \(un), password is \((data as User).password)")
            return .success(data)
        } catch let err {
            print("No such user \(un)")
            return .failure(err)
        }
    }

    
}

