//
//  ViewController.swift
//  Storing Images From The Web
//
//  Created by RANBIJAY KUMAR on 17/06/16.
//  Copyright © 2016 SaturnMob. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var ran: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // My LinkedIn Profile pic url path 
        
     /*   let url = NSURL(string: "https://media.licdn.com/mpr/mpr/shrinknp_400_400/AAEAAQAAAAAAAAe2AAAAJDgxZGFlOWNiLWY3ZmItNGVkYS1hOGU3LThmNzI1YWQwOTBjYQ.jpg")
        
        let urlRequest = NSURLRequest(URL: url!)
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue.mainQueue(), completionHandler: {
            response, data, error in
            
            if error != nil {
                
                print("There was an error!")
            } else {
                
                let image = UIImage(data: data!)
                
                //Download the Image
                // self.ran.image = image
                
                var documentsDirectory: String
                
                var paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                
                if paths.count > 0 {
                    
                    documentsDirectory = paths[0] as! String
                    
                    let savePath = documentsDirectory + "/ran.jpg"
                    
                    //Save file into the directory
                    
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    
                    self.ran.image = UIImage(named: savePath)
                    
                    
                }
                
                
                
            }
            
            
        })
        
*/
        
       // Working Code
        
        var documentsDirectory: String
        
        var paths: [AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        
        if paths.count > 0 {
            
            documentsDirectory = paths[0] as! String
            
            let savePath = documentsDirectory + "/ran.jpg"
            
            //Save file into the directory
            
           // NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
            
            self.ran.image = UIImage(named: savePath)

        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

