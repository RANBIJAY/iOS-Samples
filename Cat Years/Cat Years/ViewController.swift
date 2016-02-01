//
//  ViewController.swift
//  Cat Years
//
//  Created by RANBIJAY KUMAR on 01/02/16.
//  Copyright (c) 2016 SaturnMob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var age: UITextField!
    
   
    @IBOutlet var resultLabel: UILabel!
    
    
    
    @IBAction func findAge(sender: AnyObject) {
        
        var enteredAge = age.text.toInt()
        

        
        if enteredAge != nil {
        
            var catYears = enteredAge! * 7
            println(catYears)
            
            resultLabel.text = "Your Cat is \(catYears) in cat years"
        }
        
        else{
            resultLabel.text = "Please enter a number in the box."
        }
        

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

