//
//  ViewController.swift
//  BusinessCard
//
//  Created by Baird, Seth J on 10/20/22.
//

import UIKit

class ViewController: UIViewController {
    
    //init view elements
    let pictureView = UIImageView()
    let nameLabel = UILabel()
    let extendBtn = UIButton()
    let titleLabel = UILabel()
    let emailLabel = UILabel()
    let campusLabel = UILabel()
    
    //adaptive sizes based on display
    let screenWidth = Int(UIScreen.main.bounds.width)
    let screenHeight = Int(UIScreen.main.bounds.height)
    let marginWidth = Int(Double(Int(UIScreen.main.bounds.width))*0.1)
    let marginHeight = Int(Double(Int(UIScreen.main.bounds.height))*0.1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make sure info label is in correct state
        toggleInfo(UIButton())
        
        //set color and add elements to view
        view.backgroundColor = .systemGray2
        buildImageView(image: "seth")
        buildNameLabel(name: "Seth Baird")
        buildTitleLabel(title: "Student")
        buildInfoButton()
        buildEmailLabel(email: "seth.baird.587@k12.friscoisd.org")
        buildCampusLabel(campus: "Memorial High School")
    }
    
    //switch from show to hide label
    @objc func toggleInfo(_ sender: UIButton){
        emailLabel.isHidden.toggle()
        campusLabel.isHidden.toggle()
        if(emailLabel.isHidden){
            extendBtn.setTitle("Tap to show contact info", for: .normal)
        }else{
            extendBtn.setTitle("Tap to hide contact info", for: .normal)
        }
    }
    
    //all view element functions
    
    func buildImageView(image: String) {
        // imageview
        pictureView.frame = CGRect(x: (screenWidth/2)-(marginWidth*2), y: marginHeight*2, width: (marginWidth*4), height: (marginWidth*4))
        pictureView.layer.cornerRadius = CGFloat(marginWidth*2)
        pictureView.clipsToBounds = true
        pictureView.image = UIImage.init(named: image)
        pictureView.layer.borderWidth = 2
        pictureView.layer.borderColor = UIColor.systemRed.cgColor
        view.addSubview(pictureView)
    }
    
    func buildNameLabel(name: String) {
        //name
        nameLabel.frame = CGRect(x: marginWidth, y: marginHeight*4, width: screenWidth-(marginWidth*2), height: marginHeight)
        nameLabel.text = name
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.addSubview(nameLabel)
    }
    
    func buildTitleLabel(title: String) {
        //title
        titleLabel.frame = CGRect(x: marginWidth, y: (marginHeight/2)*9, width: screenWidth-(marginWidth*2), height: marginHeight)
        titleLabel.text = title
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        view.addSubview(titleLabel)
    }
    
    func buildInfoButton() {
        //extend info button
        extendBtn.frame = CGRect(x: marginWidth, y: (marginHeight/2)*11, width: screenWidth-(marginWidth*2), height: marginHeight)
        extendBtn.addTarget(self, action:#selector(self.toggleInfo), for: .touchUpInside)
        extendBtn.setTitle("Tap to show contact info", for: .normal)
        extendBtn.titleLabel?.textAlignment = .center
        extendBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .light)
        //maybe underline
        extendBtn.setTitleColor(.black, for: .normal)
        view.addSubview(extendBtn)
    }
    
    func buildEmailLabel(email: String) {
        //email
        emailLabel.frame = CGRect(x: marginWidth, y: (marginHeight/2)*12, width: screenWidth-(marginWidth*2), height: marginHeight)
        emailLabel.text = email
        emailLabel.textAlignment = .center
        emailLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        view.addSubview(emailLabel)
    }
    
    func buildCampusLabel(campus: String) {
        //campus
        campusLabel.frame = CGRect(x: marginWidth, y: (marginHeight/2)*13, width: screenWidth-(marginWidth*2), height: marginHeight)
        campusLabel.text = campus
        campusLabel.textAlignment = .center
        campusLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        view.addSubview(campusLabel)
    }

    
}

