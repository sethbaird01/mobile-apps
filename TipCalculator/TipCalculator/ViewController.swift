//
//  ViewController.swift
//  TipCalculator
//
//  Created by Baird, Seth J on 12/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    //outlets

    @IBOutlet weak var billAmountIn: UITextField!
    
    @IBOutlet weak var tipSelection: UISegmentedControl!
    
    @IBOutlet weak var customTipStack: UIStackView!
    
    @IBOutlet weak var customTip: UITextField!
    
    @IBOutlet weak var tipAmountOut: UILabel!
    
    @IBOutlet weak var totalOut: UILabel!
    
    //actions
    
    @IBAction func billAmountAct(_ sender: Any) {
        //return button on bill entry
        self.view.endEditing(true)
        calculate()
    }
    
    @IBAction func tipSelected(_ sender: Any) {
        //return button on custom tip entry
        if(tipSelection.selectedSegmentIndex == 3){
            customTipStack.isHidden = false
        }else{
            customTipStack.isHidden = true
        }
        calculate()
    }
    
    //validate and store custom tip
    var customTipVal: Double = 0.0
    @IBAction func customTipSelect(_ sender: Any) {
        
        //removes punctuation like "%"
        customTipVal = (Double(customTip.text?.components(separatedBy: CharacterSet.punctuationCharacters).joined(separator: "") ?? "0.0") ?? 0.0) * 0.01
        print(customTipVal)
        calculate()
    }
    
    //run tip calculation math
    func calculate(){
        let valueIn: Double = Double(billAmountIn.text ?? "0") ?? 0.0
        var calculatedTip = 0.0
        switch tipSelection.selectedSegmentIndex {
        case 0:
            calculatedTip = valueIn * 0.15
        case 1:
            calculatedTip = valueIn * 0.18
        case 2:
            calculatedTip = valueIn * 0.20
        case 3:
            calculatedTip = valueIn * customTipVal
        default:
            print("segmented selection error")
            return
        }
            //dont update text if incorrect value (0) supplied anywhere
        if(calculatedTip != 0.0){
            tipAmountOut.text = "$\(calculatedTip)0"
            totalOut.text = "$\(valueIn + calculatedTip)0"
        }
        
    }
    
    //change all ui elements to default
    @IBAction func resetUI() {
        customTipStack.isHidden = true
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
        //initialize ui on app startup
        resetUI()
    }
    


}

