//
//  SetupController.swift
//  Trivia
//
//  Created by Baird, Seth J on 2/21/23.
//

import UIKit

class SetupController: UIViewController {
    static let saved = "data"
    
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
    
    override func viewWillDisappear(_ animated: Bool) {
        //first gain access to next VC
        
        let questionVC = tabBarController?.viewControllers![1] as! QuestionController
        
        //pass data
        questionVC.selectedNumber = numberPD.data[numberPicker.selectedRow(inComponent: 0)] as! Int
        questionVC.selectedCategory = categoryPD.data[categoryPicker.selectedRow(inComponent: 0)] as! String
        
    }

    @IBAction func goButton(_ sender: Any) {
        //switch tab for user
        //let viewWillDisappear handle data transfer
        tabBarController?.selectedIndex = 1
    }
    
}

