//
//  Square.swift
//  Squares
//
//  Created by Baird, Seth J on 11/17/22.
//

import UIKit

class Square: UIView {

    var location = CGPoint(x: 0, y: 0)
    var lastLocation = CGPoint(x: 0, y: 0)
    
    var xVel: Double = 0.5
    var yVel: Double = 0.5
    let moveConstant: Double = 5.0
    
    var timer = Timer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: CGFloat(Double.random(in: 0.0...0.95)), green: CGFloat(Double.random(in: 0.0...0.95)), blue: CGFloat(Double.random(in: 0.0...0.95)), alpha: 1)
        xVel = Double.random(in: 0.2...0.9)
        yVel = Double.random(in: 0.2...0.9)
        //timer
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(tick), userInfo: nil, repeats: true)
        
        let gesture: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(moveSquare))
        gestureRecognizers = [gesture]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func moveSquare(_recognizer: UIPanGestureRecognizer){
        location = _recognizer.translation(in: superview)
        self.center = CGPoint(x: lastLocation.x + location.x, y: lastLocation.y + location.y)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.bringSubviewToFront(self)
        self.superview?.bringSubviewToFront(self)

        lastLocation = self.center
    }
    
    @objc
    func tick(){
        center.x += CGFloat(xVel*moveConstant)
        center.y += CGFloat(yVel*moveConstant)
        
        //edge collision
        if(center.x <= 0.0 || center.x >= superview!.frame.width){
            xVel *= -1.0
        }
        if(center.y <= 0.0 || center.y >= superview!.frame.height){
            yVel *= -1.0
        }
    }
}
