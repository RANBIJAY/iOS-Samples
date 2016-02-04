//
//  ViewController.swift
//  Times Table
//
//  Created by RANBIJAY KUMAR on 04/02/16.
//  Copyright (c) 2016 SaturnMob. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var sliderValue: UISlider!
    
    @IBOutlet var table: UITableView!
    
    
    @IBAction func sliderMoved(sender: AnyObject) {
        
        table.reloadData()
        
        println(sliderValue)
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 20
        
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        let timesTable = Int(sliderValue.value * 20)
        
        cell.textLabel?.text = String(timesTable * (indexPath.row + 1))
        
        return cell
        
    }
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

