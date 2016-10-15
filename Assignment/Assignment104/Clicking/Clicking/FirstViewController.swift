//
//  FirstViewController.swift
//  Clicking
//
//  Created by Won Yong Ha on 10/11/16.
//  Copyright © 2016 A290 Spring 2016 - woha. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    var count = 0
    var addingNum = 1
    
    @IBOutlet weak var btn_Score: UIButton!
    
    
    @IBAction func scoreButton(sender: UIButton) {
        
    }
    
    @IBOutlet var unitTypeLabel:UILabel!
    
    // clickingMainButton Function
    // The major action when the user press the button
    // return: void
    @IBAction func clickingMainButton(sender: UIButton) {
        
        let stringKey = NSUserDefaults.standardUserDefaults()
        
        let addingNumNS = stringKey.stringForKey("savedAddingNum")
        if addingNumNS != nil {
            addingNum = Int(addingNumNS!)!
        } else {
            addingNum = 1
        }
        
        count += addingNum
        
        btn_Score.setTitle(String(count), forState: .Normal)
        
        let text = btn_Score.titleLabel!.text
        NSUserDefaults.standardUserDefaults().setObject(text, forKey: "savedCount")
        NSUserDefaults.standardUserDefaults().synchronize()
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidLoad()
        let stringKey = NSUserDefaults.standardUserDefaults()
        
        let addingNumNS = stringKey.stringForKey("savedAddingNum")
        if addingNumNS != nil {
            addingNum = Int(addingNumNS!)!
        } else {
            addingNum = 1
        }
        let num = stringKey.stringForKey("savedCount")
        var number = 0
        
        if num != nil {
            number = Int(num!)!
        } else {
            number = 0
        }
        
        count = number
        
        btn_Score.setTitle(String(number), forState: .Normal)
        
        super.viewWillAppear(animated)
        refreshFields()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let stringKey = NSUserDefaults.standardUserDefaults()
        
        let addingNumNS = stringKey.stringForKey("savedAddingNum")
        if addingNumNS != nil {
            addingNum = Int(addingNumNS!)!
        } else {
            addingNum = 1
        }
        let num = stringKey.stringForKey("savedCount")
        var number = 0
        
        if num != nil {
            number = Int(num!)!
        } else {
            number = 0
        }
        
        count = number
        
        btn_Score.setTitle(String(number), forState: .Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func refreshFields(){
        let myDefaults = NSUserDefaults.standardUserDefaults()
        unitTypeLabel.text = myDefaults.stringForKey(unitTypeKey)
        myDefaults.synchronize()
    }

}

