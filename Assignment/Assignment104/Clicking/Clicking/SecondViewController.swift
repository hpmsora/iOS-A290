//
//  SecondViewController.swift
//  Clicking
//
//  Created by Won Yong Ha on 10/11/16.
//  Copyright © 2016 A290 Spring 2016 - woha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var rateTextBox: UILabel!
    
    //Double amound for clicking
    @IBAction func upgradeButton_1(sender: UIButton) {
        
        let stringKey = NSUserDefaults.standardUserDefaults()
        
        let addingNumNS = stringKey.stringForKey("savedAddingNum")
        
        var addingNum = 1
        
        if addingNumNS != nil {
            addingNum = Int(addingNumNS!)!
        }
        
        let num = stringKey.stringForKey("savedCount")
        var number = 0
        
        if num != "" {
            number = Int(num!)!
        }
        
        let cost = 2^(3 + addingNum)
        if number > cost {
            number -= cost
            
            addingNum = addingNum * 2
            
            NSUserDefaults.standardUserDefaults().setObject(String(addingNum), forKey: "savedAddingNum")
            NSUserDefaults.standardUserDefaults().setObject(String(number), forKey: "savedCount")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            
        } else {
            rateTextBox.text = "Not Enough Clicks!"
        }

    }
    
    @IBAction func upgradeButton_2(sender: UIButton) {
    }
    
    @IBAction func upgradeButton_3(sender: UIButton) {
    }
    
    @IBAction func upgradeButton_4(sender: UIButton) {
    }
    
    @IBAction func resetButton(sender: UIButton) {
        NSUserDefaults.standardUserDefaults().setObject("1", forKey: "savedAddingNum")
        NSUserDefaults.standardUserDefaults().setObject("0", forKey: "savedCount")
        NSUserDefaults.standardUserDefaults().synchronize()
        
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

