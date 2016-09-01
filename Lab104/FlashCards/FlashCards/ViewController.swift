//
//  ViewController.swift
//  FlashCards
//
//  Created by Won Yong Ha on 8/31/16.
//  Copyright © 2016 A290. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBAction func showQuestion(sender: UIButton) {
        self.questionLabel.text = "How old are you?"
        self.answerLabel.text = "(try guessing...)"
    }

    @IBAction func showAnswer(sender: UIButton) {
        self.answerLabel.text = "I'm 10 years old."
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

