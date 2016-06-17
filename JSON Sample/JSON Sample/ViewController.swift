//
//  ViewController.swift
//  JSON Sample
//  Reading JSON Data from the Web.
//  Created by RANBIJAY KUMAR on 17/06/16.
//  Copyright © 2016 SaturnMob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Sample url path - shows JSON data. Create account and access the sample Web JSON Data to display into the client end "http://www.geonames.org/login". "
        
        let urlPath = "http://api.geonames.org/citiesJSON?north=44.1&south=-9.9&east=-22.4&west=55.2&lang=de&username=demo"
        
        let url = NSURL (string: urlPath)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url!, completionHandler: { data, response, error -> Void in
            
            if (error != nil) {
                
                print(error)
                
            } else {
                
                
                let jsonResult = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                
                print(jsonResult)
                
                // print(jsonResult["geonames"]!["countrycode"])
                
                
            }
            
        })
        
        task.resume()
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }


}

