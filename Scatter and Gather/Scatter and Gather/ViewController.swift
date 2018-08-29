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
    let labelDimensions: CGFloat = 40.0
    let labelPadding: CGFloat = 8.0

    
    // MARK: - Actions
    
    @IBAction func toggle(_ sender: Any) {
        if !shouldScramble {
            scatter()
        } else {
            gather()
        }
        
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
                                              toItem: view, attribute: .centerY, multiplier: 1.0, constant: -imageView.bounds.height)
        NSLayoutConstraint.activate([imageViewWidth, imageViewHeight, imageViewCenterX, imageViewCenterY])
        
        
        var xPosition: CGFloat = 45.0
        
        let word = "Lambda"
        for char in word {
            let label = UILabel(frame: CGRect(x: xPosition, y: view.bounds.height/2 + 20, width: labelDimensions, height: labelDimensions))
            label.text = String(char)
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 32.0)
            
            view.addSubview(label)
            xPosition += labelDimensions + labelPadding
        }
    }
    
    private func scatter() {
        
        UIView.animate(withDuration: 2.0) {
            self.view.subviews[0].alpha = 0.0
            
            for i in 1..<self.view.subviews.count {
                
                let eachLabel = self.view.subviews[i] as? UILabel
                var frame = self.view.subviews[i].frame
                let viewWidth = UInt32(self.view.bounds.width)
                let viewHeight = UInt32(self.view.bounds.height)
                frame.origin.x = CGFloat(arc4random_uniform(viewWidth - 40))
                frame.origin.y = CGFloat(arc4random_uniform(viewHeight - 40 - 80) + 80)
                eachLabel?.frame = frame
                eachLabel?.layer.backgroundColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1).cgColor
                
//                UIView.transition(with: eachLabel!, duration: 2.0, options: .transitionCrossDissolve, animations: {
//                    eachLabel?.textColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1)
//                }, completion: nil)
                
                // So randomDegree is never 0
                let randomDegree = CGFloat(arc4random_uniform(359) + 1)
                // Converts to radians
                let randomAngle = (randomDegree*CGFloat.pi)/180.0
                eachLabel?.transform = CGAffineTransform(rotationAngle: randomAngle)
            }
        }
    }
    
    private func gather() {
        UIView.animate(withDuration: 2.0) {
            self.view.subviews[0].alpha = 1
            var xPosition: CGFloat = 45.0
            for i in 1..<self.view.subviews.count {
                self.view.subviews[i].transform = .identity
                var frame = self.view.subviews[i].frame
                frame.origin.x = xPosition
                frame.origin.y = self.view.bounds.height/2 + 20
                self.view.subviews[i].frame = frame
                xPosition += self.labelDimensions + self.labelPadding
                // .transform = .identity can't go at the bottom or things get a little messed up
                self.view.subviews[i].layer.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0).cgColor
            }
        }
    }
}

