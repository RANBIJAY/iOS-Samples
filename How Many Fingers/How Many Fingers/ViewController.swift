//
//  ViewController.swift
//  How Many Fingers
//
//  Created by RANBIJAY KUMAR on 01/02/16.
//  Copyright (c) 2016 SaturnMob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var guess: UITextField!
    
    
    @IBOutlet var resultLabel: UILabel!
    
    
    @IBAction func guessButton(sender: AnyObject) {
        
        var numberOfFingers = arc4random_uniform(6)
        
        var guessNumberOfFingers = guess.text.toInt()
        
        if guessNumberOfFingers != nil  {
            
            if Int(numberOfFingers) == guessNumberOfFingers {

                resultLabel.text = " Congrats, you Got it!"
                
                guess.text = ""
                
            } else {
                
                resultLabel.text = "Nope, It was '\(numberOfFingers)'. Please try again! :-)"
            }
            
        } else {
            
            resultLabel.text = "Please enter a number only between 0 - 5."
        }
        
        println(guess.text)
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

