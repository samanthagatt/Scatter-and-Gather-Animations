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
        
        
    }

    
    // MARK: - Properties
    
    var shouldScramble = false

    
    // MARK: - Actions
    
    @IBAction func toggle(_ sender: Any) {
        shouldScramble = !shouldScramble
    }
}

