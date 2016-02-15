//
//  ViewController.swift
//  Keyboard Controller
//
//  Created by RANBIJAY KUMAR on 15/02/16.
//  Copyright (c) 2016 SaturnMob. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var text: UITextField!
    
    @IBOutlet var lable: UILabel!
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        lable.text = text.text
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.text.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
       
        self.view.endEditing(true)
    
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
       
        textField.resignFirstResponder()
        
        return true
    }

}

