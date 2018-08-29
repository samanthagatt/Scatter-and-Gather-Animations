//
//  ViewController.swift
//  Scatter and Gather
//
//  Created by Samantha Gatt on 8/29/18.
//  Copyright © 2018 Samantha Gatt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }

    
    // MARK: - Properties
    
    var shouldScramble = false

    
    // MARK: - Actions
    
    @IBAction func toggle(_ sender: Any) {
        shouldScramble = !shouldScramble
    }
    
    
    // MARK: - Private Functions
    
    private func setup() {
        
        let image = UIImage(named: "lambdaLogo")!
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        let imageViewWidth = NSLayoutConstraint(item: imageView, attribute: .width,
                                                relatedBy: .equal,
                                                toItem: view, attribute: .width,
                                                multiplier: 0.5,
                                                constant: -32)
        let imageViewHeight = NSLayoutConstraint(item: imageView, attribute: .height,
                                                 relatedBy: .equal,
                                                 toItem: imageView, attribute: .width,
                                                 multiplier: 1.0,
                                                 constant: 0.0)
        let imageViewCenterX = NSLayoutConstraint(item: imageView, attribute: .centerX,
                                              relatedBy: .equal,
                                              toItem: view, attribute: .centerX,
                                              multiplier: 1.0,
                                              constant: 0.0)
        let imageViewCenterY = NSLayoutConstraint(item: imageView, attribute: .centerY,
                                              relatedBy: .equal,
                                              toItem: view, attribute: .centerY, multiplier: 1.0, constant: -60)
        NSLayoutConstraint.activate([imageViewWidth, imageViewHeight, imageViewCenterX, imageViewCenterY])
        
        
        let labelDimensions: CGFloat = 40.0
        let labelPadding: CGFloat = 8.0
        var xPosition: CGFloat = 45.0
        
        let word = "Lambda"
        for char in word {
            let label = UILabel(frame: CGRect(x: xPosition, y: 450.0, width: labelDimensions, height: labelDimensions))
            label.text = String(char)
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            
            view.addSubview(label)
            xPosition += labelDimensions + labelPadding
        }
    }
}

