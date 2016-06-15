//
//  ViewController.swift
//  Swipes And Shakes
//
//  Created by RANBIJAY KUMAR on 15/06/16.
//  Copyright © 2016 SaturnMob. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    var sounds = ["bean", "belch", "giggle", "pew", "pig", "snore", "static", "uuu"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if event!.subtype == UIEventSubtype.MotionShake {
            
            
            let randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            
            
            let fileLocation = NSBundle.mainBundle().pathForResource(sounds[randomNumber], ofType: "mp3")
            
            var error: NSError? = nil
            
            do {
                player = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
            } catch let error1 as NSError {
                error = error1
                // player = nil
            }
            
            player.play()
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

