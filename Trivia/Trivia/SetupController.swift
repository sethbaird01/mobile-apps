//
//  ViewController.swift
//  Trivia
//
//  Created by Baird, Seth J on 2/21/23.
//

import UIKit

class SetupController: UIViewController {
    
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    @IBOutlet weak var numberPicker: UIPickerView!
    
    let categoryPD = PickerDelegate(data: Array(TriviaDB.db.keys))

    let numberPD = PickerDelegate(data: Array(arrayLiteral: 3, 4, 5, 6, 7, 8, 9, 10))
   
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPicker.delegate = categoryPD
        categoryPicker.dataSource = categoryPD
        numberPicker.delegate = numberPD
        numberPicker.dataSource = numberPD
    }

    @IBAction func goButton(_ sender: Any) {
        tabBarController?.selectedIndex = 1
    }
    
}

