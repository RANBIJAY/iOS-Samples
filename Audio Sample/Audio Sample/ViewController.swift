//
//  ViewController.swift
//  Audio Sample
//
//  Created by RANBIJAY KUMAR on 10/06/16.
//  Copyright © 2016 SaturnMob. All rights reserved.
//


import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet var sliderValue: UISlider!
    
    @IBAction func play(sender: AnyObject) {
        
        let audioPath = NSBundle.mainBundle().pathForResource("bach1", ofType: "mp3")!
        
        var error : NSError? = nil
        
        do {
            player = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath))
        } catch let error1 as NSError {
            error = error1
            // player = nil
        }
        
        if error == nil {
            
            player.play()
            
        } else {
            
            print(error)
            
        }
    }
    
    @IBAction func pause(sender: AnyObject) {
        
        player.pause()
        
    }
    
    @IBAction func sliderChanged(sender: AnyObject) {
        
        player.volume = sliderValue.value
        
        
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