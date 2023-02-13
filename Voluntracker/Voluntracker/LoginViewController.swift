//
//  LoginViewController.swift
//  Voluntracker
//
//  Created by Baird, Seth J on 1/26/23.
//

import UIKit

class LoginViewController: UIViewController {

    var activeUser: CredentialStore.User? = nil
    var defaults: UserDefaults? = nil
    var alerted = false
    var resetMode = false

    //written on segue prepare()
    @IBOutlet weak var percentageOut: UILabel!
    
    @IBOutlet weak var imageOut: UIImageView!
    @IBOutlet weak var progressOut: UIProgressView!
    @IBOutlet weak var buttonOut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        //MARK: TODO check goal hours on update and send alert if reached , also make image unhidden , also change button into reset
        
        // Do any additional setup after loading the view.
    }
    @IBAction func logButton(_ sender: Any) {
        if(resetMode){
            CredentialStore.updateHoursTo(user: activeUser!, newHours: 0)
        }else{
            CredentialStore.updateHoursTo(user: activeUser!, newHours: activeUser!.hours+1)
        }
        updateUI()
    }
    
    func updateUI(){
        var percentage: Double = (Double(activeUser!.hours)/Double(activeUser!.goal))
        progressOut.progress = Float(percentage)
        percentageOut.text = "\(Int(percentage*100))%"
        if(activeUser!.hours >= activeUser!.goal){
            imageOut.isHidden = false
            buttonOut.titleLabel?.text = "Reset"
            resetMode = true
            if(!alerted){
                alerted = true
                //alert
                let dialogMessage = UIAlertController(title: "Goal reached!", message: "Congratulations on meeting your goal! You can reset back to 0 with the \"Reset\" button.", preferredStyle: .alert)
                
                //add button
                let ok = UIAlertAction(title: "Dismiss", style: .default)
                
                dialogMessage.addAction(ok)

                //present alert
                self.present(dialogMessage, animated: true, completion: nil)
            }
        }
    }


}
