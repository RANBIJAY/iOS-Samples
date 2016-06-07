//
//  ViewController.swift
//  Animations
//
//  Created by RANBIJAY KUMAR on 04/06/16.
//  Copyright © 2016 SaturnMob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 1
    
    var timer = NSTimer()
    
    var isAnimating = true
    
    @IBOutlet var alienImage: UIImageView!

    @IBAction func updateImage(sender: AnyObject) {
       
        if isAnimating == true {
            
            timer.invalidate()
            
            isAnimating = false
        
        } else {
            
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: ("doAnimation"), userInfo: nil, repeats: true)
            
            isAnimating = true
            
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: ("doAnimation"), userInfo: nil, repeats: true)
    }
  
    func doAnimation() {
        
        if counter == 2 {
            counter = 1
        } else {
            counter++
        }
        
        alienImage.image = UIImage(named: "frame\(counter).png")
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

