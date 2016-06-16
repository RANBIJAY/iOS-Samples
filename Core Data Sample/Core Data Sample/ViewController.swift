//
//  ViewController.swift
//  Core Data Sample
//
//  Created by RANBIJAY KUMAR on 16/06/16.
//  Copyright © 2016 SaturnMob. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        
        newUser.setValue("Ranbijay", forKey: "userName")
        
        newUser.setValue("Password", forKey: "passWord")
        
        try! context.save()
        
        let request = NSFetchRequest(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        let results =  try! context.executeFetchRequest(request)
        
        print(results)
        
        if results.count > 0 {
        
        for result: AnyObject in results {
            
            print(result)
            //print(result.password)
        }
        
        } else {
            
            print("No Results")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

