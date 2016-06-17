//
//  ViewController.swift
//  WebView Sample
//
//  Created by RANBIJAY KUMAR on 17/06/16.
//  Copyright © 2016 SaturnMob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Calling Web into the WebView to display.
        

        let url = NSURL(string: "http://ranbijay.blogspot.in/")
        
        let request = NSURLRequest(URL: url!)
        
        webView.loadRequest(request)
        
       
        // Using HTML to display into the WebView.
        // webView.loadHTMLString("<html><head></head><body><h1>Hello World!</h1></body></html>", baseURL: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

