//
//  MyTableViewController.swift
//  MyTableViewControllerTest
//
//  Created by Won Yong Ha on 9/19/16.
//  Copyright © 2016 iu. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController {
    var i = 0
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = "Hello! This is cell " + String(i)
        i += 1
        return cell
    }
    
}
