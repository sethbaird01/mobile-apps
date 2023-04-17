//
//  SettingsViewController.swift
//  Wordle
//
//  Created by Baird, Seth J on 4/13/23.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        darkModeOut.isOn = (overrideUserInterfaceStyle == .dark)
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var darkModeOut: UISwitch!
    @IBOutlet weak var hardModeOut: UISwitch!
    
    
    @IBAction func darkModeSwitched(_ sender: Any) {
        if(darkModeOut.isOn){
            overrideUserInterfaceStyle = .dark
        }else{
            overrideUserInterfaceStyle = .light
        }
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let interfaceStyle = window?.overrideUserInterfaceStyle == .unspecified ? UIScreen.main.traitCollection.userInterfaceStyle : window?.overrideUserInterfaceStyle
        if (interfaceStyle != .dark){
        window?.overrideUserInterfaceStyle = .dark
        } else {
            window?.overrideUserInterfaceStyle = .light
        }
    }
    
    @IBAction func hardModeSwitched(_ sender: Any) {
        GameViewController.wordle.setDifficulty(new_hard: hardModeOut.isOn)
    }
}
