//
//  CustomTextField.swift
//  Wordle
//
//  Created by Baird, Seth J on 4/17/23.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
    //given shake code
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        
        animation.duration     = 0.05
        animation.repeatCount  = 3
        animation.autoreverses = true
        animation.fromValue    = NSValue(cgPoint: CGPoint(x: self.center.x - 4.0, y: self.center.y))
        animation.toValue      = NSValue(cgPoint: CGPoint(x: self.center.x + 4.0, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
    }
}
