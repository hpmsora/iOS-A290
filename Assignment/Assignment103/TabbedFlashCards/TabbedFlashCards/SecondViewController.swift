//
//  SecondViewController.swift
//  TabbedFlashCards
//
//  Created by Won Yong Ha on 9/20/16.
//  Copyright © 2016 A290 Spring 2016 - woha. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var questionTextField: UITextField!
    
    @IBOutlet weak var answerTextField: UITextField!
    
    
    @IBAction func buttonOkAction(sender: AnyObject) {
        print ("self.questionTextField.text = \(self.questionTextField.text)")
        print ("self.answerTextField.text = \(self.answerTextField.text)")
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.questionTextField.text = "this is where the Question will appear"
        self.answerTextField.text = "this is where the Answer will appear"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

