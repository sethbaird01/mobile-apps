//
//  ViewController.swift
//  iSpy
//
//  Created by Baird, Seth J on 4/25/23.
//

import UIKit

class ViewController: UIViewController,  UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageOut: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        // Do any additional setup after loading the view.
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageOut
    }
    
    func updateZoomFor(size: CGSize){
        let widthScale = size.width / imageOut.bounds.width
        let heightScale = size.height / imageOut.bounds.height
        let scale = min(widthScale, heightScale)
        scrollView.minimumZoomScale = scale
        scrollView.zoomScale = scale
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateZoomFor(size: view.bounds.size)
    }
}

