//
//  ViewController.swift
//
//  Copyright 2011-present Parse Inc. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
// Spinners ... (Progress bar/Loading Screen)!
//=======================================================================================================
    
    @IBAction func pause(sender: AnyObject) {
        
        activityIndicator = UIActivityIndicatorView(frame: CGRectMake(0, 0, 50, 50))
        
        activityIndicator.center = self.view.center
        
        activityIndicator.hidesWhenStopped = true
        
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        
       // UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
    }
    
    
    @IBAction func resume(sender: AnyObject) {
        
        activityIndicator.stopAnimating()
        
        // UIApplication.sharedApplication().endIgnoringInteractionEvents()
        
    }
    
//=======================================================================================================
    


// Alert Message... !
//=======================================================================================================
    
    @IBAction func createAlert(sender: AnyObject) {
        
        let alert = UIAlertController (title: "Hey there..!", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.Alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
          
            self.dismissViewControllerAnimated(true, completion: nil)
            
            
        }))
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
//=======================================================================================================
    


// Getting Image from Photo-Library and Camera... !
//=======================================================================================================
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        print("Image Selected")
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
        importedImage.image = image
        
    }
    
    
    @IBAction func importedImage(sender: AnyObject) {
        
        let image = UIImagePickerController()
        
        image.delegate = self
        
        image.sourceType =  UIImagePickerControllerSourceType.PhotoLibrary
        
        image.allowsEditing = false
        
        self.presentViewController(image, animated: true, completion: nil)
        
        
    }
    
    @IBOutlet var importedImage: UIImageView!
    
//=======================================================================================================
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        let product = PFObject(className: "Products")
        
        product["name"] = "Pizza"
        
        product["description"] = "Deliciously cheesy"
        
        product["price"] = 9.99
        
        product.saveInBackgroundWithBlock { (success, error) -> Void in
            
            if success == true {
                
                print("Successful")
                
            } else {
                
                print("Failed")
                print(error)
                
            }
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

