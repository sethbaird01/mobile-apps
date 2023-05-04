//
//  PickerDelegate.swift
//  MyNance
//
//  Created by Baird, Seth J on 5/2/23.
//

import Foundation
import UIKit

class PickerDelegate: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var data: [String]
    
    init(data: [String]) {
        print("!!! \(data)")
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
        return data[row]
    }
    
    //called when choice is made
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            //category
        TransactionViewController.pickerChanged(self, row: row)
    }
}
