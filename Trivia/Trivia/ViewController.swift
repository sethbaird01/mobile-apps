//
//  ViewController.swift
//  Trivia
//
//  Created by Baird, Seth J on 2/21/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerData = TriviaDB.db.keys
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    

    @IBOutlet weak var categoryPicker: UIPickerView!
    
    @IBOutlet weak var numberPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryPicker.delegate = self
        self.categoryPicker.dataSource = self
        self.numberPicker.delegate = self
        self.numberPicker.dataSource = self
        
        
    }


}

