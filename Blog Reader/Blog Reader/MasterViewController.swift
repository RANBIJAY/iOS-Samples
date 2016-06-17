//
//  MasterViewController.swift
//  Blog Reader
//
//  Created by RANBIJAY KUMAR on 17/06/16.
//  Copyright © 2016 SaturnMob. All rights reserved.
//

// API_KEY [Browser] =  AIzaSyCM1ZyVwbrk61Ci88014_mhSQyzG-PWNJQ 

// Test Browser URL: https://www.googleapis.com/blogger/v3/blogs/byurl?url=https://googleblog.blogspot.in/&key=AIzaSyCM1ZyVwbrk61Ci88014_mhSQyzG-PWNJQ

// Broswer Display Contents: https://www.googleapis.com/blogger/v3/blogs/10861780/posts?key=AIzaSyCM1ZyVwbrk61Ci88014_mhSQyzG-PWNJQ

import UIKit
import CoreData

class MasterViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var managedObjectContext: NSManagedObjectContext? = nil
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let context: NSManagedObjectContext = appDel.managedObjectContext!
        
        let url = NSURL(string: "https://www.googleapis.com/blogger/v3/blogs/10861780/posts?key=AIzaSyCM1ZyVwbrk61Ci88014_mhSQyzG-PWNJQ")
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                
                print(error)
                
            } else {
                
                // println(NSString(data: data, encoding: NSUTF8StringEncoding))
                
                let jsonResult = (try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)) as! NSDictionary
                
                if jsonResult.count > 0 {
                    
                    if let items = jsonResult["items"] as? NSArray {
                        
                        let request = NSFetchRequest(entityName: "Posts")
                        
                        request.returnsObjectsAsFaults = false
                        
                        let results = try! context.executeFetchRequest(request)
                        
                        if results.count > 0 {
                            
                            for result in results {
                                
                                context.deleteObject(result as! NSManagedObject)
                                
                                do {
                                    try context.save()
                                } catch _ {
                                }
                                
                            }
                            
                        }
                        
                        
                        for item in items {
                            
                            if let title = item["title"] as? String {
                                
                                if let content = item["content"] as? String {
                                    
                                    let newPost: NSManagedObject = NSEntityDescription.insertNewObjectForEntityForName("Posts", inManagedObjectContext: context)
                                    
                                    newPost.setValue(title, forKey: "title")
                                    
                                    newPost.setValue(content, forKey: "content")
                                    
                                    do {
                                        try context.save()
                                    } catch _ {
                                    }
                                    
                                }
                                
                            }
                            
                            
                            
                        }
                        
                    }
                    
                    
                }
                
                
                self.tableView.reloadData()
                
            }
            
        })
        
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as! NSManagedObject
                (segue.destinationViewController as! DetailViewController).detailItem = object
            }
            
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionInfo = self.fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        self.configureCell(cell, atIndexPath: indexPath)
        
        return cell
    }
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as! NSManagedObject
        cell.textLabel!.text = object.valueForKey("title")!.description
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }
    
    var fetchedResultsController: NSFetchedResultsController {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest = NSFetchRequest()
        // Edit the entity name as appropriate.
        let entity = NSEntityDescription.entityForName("Posts", inManagedObjectContext: self.managedObjectContext!)
        fetchRequest.entity = entity
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "title", ascending: false)
        _ = [sortDescriptor]
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath: nil, cacheName: "Master")
        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        
        var error: NSError? = nil
        do {
            try _fetchedResultsController!.performFetch()
        } catch let error1 as NSError {
            error = error1
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            print("Unresolved error \(error), \(error!.userInfo)")
            abort()
        }
        
        return _fetchedResultsController!
    }
    var _fetchedResultsController: NSFetchedResultsController? = nil
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        self.tableView.beginUpdates()
    }
    
    
    
}

