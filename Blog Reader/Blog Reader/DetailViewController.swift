//
//  DetailViewController.swift
//  Blog Reader
//
//  Created by RANBIJAY KUMAR on 17/06/16.
//  Copyright © 2016 SaturnMob. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet var webview: UIWebView!
    
    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        
        if let detail: AnyObject = self.detailItem {
            if let wv = self.webview {
                
                wv.loadHTMLString(detail.valueForKey("content")!.description, baseURL: nil)
                
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

