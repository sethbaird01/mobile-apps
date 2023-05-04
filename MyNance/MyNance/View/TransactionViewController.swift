//
//  TransactionViewController.swift
//  MyNance
//
//  Created by Baird, Seth J on 5/2/23.
//

import UIKit

class TransactionViewController: UIViewController {
    
    static var T: Transaction? = nil
        
    var pickerDel = PickerDelegate(data: Transaction.TCategory.allCases.compactMap({$0.rawValue}))

    @IBOutlet weak var textFieldOut: UITextField!
    @IBOutlet weak var pickerOut: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerOut.delegate = pickerDel
        pickerOut.dataSource = pickerDel
        print(" !!!\(TransactionStore.getAllTransactions())")
        
        // Do any additional setup after loading the view.
    }
    
     static func pickerChanged(_ sender: PickerDelegate, row: Int){
        T?.category = Transaction.TCategory(rawValue: sender.data[row])!
    }
    
    @IBAction func textFieldChanged(_ sender: UITextField) {
        TransactionViewController.T?.desc = sender.text ?? ""
    }
    
    
    @IBAction func amountChanged(_ sender: UITextField) {
        TransactionViewController.T?.amount = Double(Int(sender.text ?? "0") ?? 0)
    }
    
    //create new transaction object
    override func viewWillAppear(_ animated: Bool) {
        TransactionViewController.T = Transaction()
    }
    //delete it
    @IBAction func cancelButton(_ sender: Any) {
        TransactionViewController.T = nil
        performSegue(withIdentifier: "unwind", sender: self)
    }
    //save it to UD
    @IBAction func saveButton(_ sender: Any) {
        //non-nil guaranteed since view must be appeared for this button/action to be triggered
        TransactionStore.storeTransaction(transaction: TransactionViewController.T!)
        performSegue(withIdentifier: "unwind", sender: self)
    }
}
