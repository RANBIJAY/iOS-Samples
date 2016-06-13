//
//  ViewController.swift
//  Back to Bach
//
//  Created by RANBIJAY KUMAR on 13/06/16.
//  Copyright © 2016 SaturnMob. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    var player:AVAudioPlayer =  AVAudioPlayer()
    
    @IBAction func play(sender: AnyObject) {
        
        player.play()
    }
    
    
    @IBAction func sliderChanged(sender: AnyObject) {
        
        player.volume = sliderValue.value
    }
    
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
    }
    
    
    @IBAction func stop(sender: AnyObject) {
        
        player.stop()
        
        player.currentTime = 0;
    }
    
    
    @IBOutlet var sliderValue: UISlider!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let audioPath = NSBundle.mainBundle().pathForResource("bach1", ofType: "mp3")
        
        var error: NSError? = nil
        
       // player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath), error: &error)
        
        do {
            player = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!))
        } catch let error1 as NSError {
            error = error1
            // player = nil
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

