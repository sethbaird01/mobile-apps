//
//  PickerDelegate.swift
//  Trivia
//
//  Created by Baird, Seth J on 2/23/23.
//

import Foundation
import UIKit

class PickerDelegate: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var data: [Any]
    
    init(data: [Any]) {
        self.data = data
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    //called to get all elements
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(data[row])"
    }
    
    //called when choice is made
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView.tag == 1){
            //category
            SetupController.selectedCategory = data[row] as! String
        }
        if(pickerView.tag == 2){
            //number
            print("picked \(data[row])")
            print("picked number as int \(data[row] as! Int)")
            SetupController.selectedNumber = data[row] as! Int
        }
    }
}
