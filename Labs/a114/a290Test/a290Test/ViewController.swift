//
//  ViewController.swift
//  a290Test
//
//  Created by Won Yong Ha on 10/3/16.
//  Copyright © 2016 A290 Spring 2016 - woha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var teamLeaderLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let myDefaults = NSUserDefaults.standardUserDefaults()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshField() {
        let myDefaults = NSUserDefaults.standardUserDefaults()
        teamLeaderLabel.text = myDefaults.stringForKey(teamLeaderKey)
        myDefaults.synchronize()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        refreshField()
    }
    


}

