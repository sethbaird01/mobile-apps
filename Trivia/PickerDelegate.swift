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
        print("init")
        self.data = data
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(data[row])"
    }
}
