//
//  ViewController.swift
//  TipCalculator
//
//  Created by Baird, Seth J on 12/2/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountIn: UITextField!
    
    @IBOutlet weak var tipSelection: UISegmentedControl!
    
    @IBOutlet weak var customTip: UITextField!
    
    @IBOutlet weak var tipAmountOut: UILabel!
    
    @IBOutlet weak var totalOut: UILabel!
    
    @IBAction func billAmountAct(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    @IBAction func tipSelected(_ sender: Any) {
        if(tipSelection.selectedSegmentIndex == 3){
            customTip.isHidden = false
        }else{
            customTip.isHidden = true
        }
        
    }
    
    @IBAction func customTipSelect(_ sender: Any) {
    }
    
    @IBAction func resetUI() {
        customTip.isHidden = true
        tipSelection.selectedSegmentIndex = 2
        tipSelection.sendActions(for: .valueChanged)
        billAmountIn.text = ""
        customTip.text = ""
        tipAmountOut.text = "$0.00"
        totalOut.text = "$0.00"
        self.view.endEditing(true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetUI()
    }
    


}

