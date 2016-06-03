//
//  ViewController.swift
//  Download Web Contents
//
//  Created by RANBIJAY KUMAR on 03/06/16.
//  Copyright © 2016 SaturnMob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let url =  NSURL (string: "https://in.linkedin.com/in/ranbijay")
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) {
            (data, response, error) in
            
            if error == nil {
                
            let urlContent = NSString(data: data!, encoding: NSUTF8StringEncoding)
                
            print(urlContent)
                
                dispatch_async(dispatch_get_main_queue()) {
                    
                      self.webView.loadHTMLString(urlContent! as String, baseURL: nil)
                    
                }
                
            }
            
            
        }
        
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

