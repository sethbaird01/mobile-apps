//
//  ViewController.swift
//  MyNance
//
//  Created by Baird, Seth J on 5/2/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var balanceOut: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
        updateBalDisplay()
    }

    @IBAction func plusButton(_ sender: Any) {
        performSegue(withIdentifier: "add", sender: self)
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateBalDisplay()
    }
    
    func updateBalDisplay() {
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .currency
        // localize to your grouping and decimal separator
        currencyFormatter.locale = Locale.current
        balanceOut.text = currencyFormatter.string(from: NSNumber(value: Mynance.balance))
    }
}

