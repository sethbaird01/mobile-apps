//
//  SetupController.swift
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
    
    static var selectedNumber: Int = 3
    static var selectedCategory: String = Array(TriviaDB.db.keys)[0]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPicker.delegate = categoryPD
        categoryPicker.dataSource = categoryPD
        numberPicker.delegate = numberPD
        numberPicker.dataSource = numberPD
    }

    @IBAction func goButton(_ sender: Any) {
        //switch tab for user
        //let viewWillAppear handle data transfer
        tabBarController?.selectedIndex = 1
    }
    
}

