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
        
        newUser.setValue("Rajvika", forKey: "userName")
        
        newUser.setValue("Password2", forKey: "passWord")
        
        try! context.save() 
        
        let request = NSFetchRequest(entityName: "Users")
        
        request.returnsObjectsAsFaults = false
        
        // To fetch the paticular row from the table
        
        request.predicate = NSPredicate(format: "userName = %@", "Tanya")
        
        let results =  try! context.executeFetchRequest(request)
        
        if results.count > 0 {
            
            print(results)
            
            for result: AnyObject in results {
                
                if let user: AnyObject = result.valueForKey("userName") as! String {
                    
                    if user as! String == "Tanya"  {
                        
                        // To 'Delete' the particluar row from the table
                        // context.deleteObject(result as! NSManagedObject)
                        // print(user)
                        // print("===============")
                        // print((user as! String) + " has been deleted.")
                        
                        // To 'Update' the attribute field value in a table row
                        
                        result.setValue("PasswordUpdate", forKey: "passWord")
                        
                        // print (result.setValue("PasswordUpdate", forKey: "passWord") )
                        
                    }
                    
                    
                }
                
                try! context.save()
                
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

