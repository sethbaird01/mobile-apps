//
//  TransactionViewController.swift
//  MyNance
//
//  Created by Baird, Seth J on 5/2/23.
//

import UIKit

class TransactionViewController: UIViewController {
    
    var pickerDel = PickerDelegate(data: ["Utilities", "Income", "Groceries"])
    @IBOutlet weak var amountOut: UILabel!
    @IBOutlet weak var textFieldOut: UITextField!
    @IBOutlet weak var pickerOut: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    static func pickerChanged(_ sender: PickerDelegate, row: Int){
        //chosen String is sender.data[row]
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
