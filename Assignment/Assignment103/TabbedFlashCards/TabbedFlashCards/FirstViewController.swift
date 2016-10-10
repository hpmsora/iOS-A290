//
//  FirstViewController.swift
//  TabbedFlashCards
//
//  Created by Won Yong Ha on 9/20/16.
//  Copyright © 2016 A290 Spring 2016 - woha. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    //add the model
    // the reference to our AppDelegate:
    var appDelegate: AppDelegate?
    // the reference to our data model:
    var myFlashCardModel: FlashCardModel?
    
    //initially, no question has been asked:
    var aQeustionIsAsked = false
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    
    @IBAction func showQuestion(sender: UIButton) {
        // obtain a reference to the AppDelegate:
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        // from the AppDelegate, obtain a reference to the Model data:
        self.myFlashCardModel = self.appDelegate?.myFlashCardModel
        
        var lQuestion : String = self.myFlashCardModel!.getNextQuestion()
        
        self.questionLabel.text = lQuestion
        self.answerLabel.text = "(try guessing...)"
    }
    
    
    @IBAction func showAnswer(sender: UIButton) {
        // obtain a reference to the AppDelegate:
        self.appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        // from the AppDelegate, obtain a reference to the Model data:
        self.myFlashCardModel = self.appDelegate?.myFlashCardModel
        
        var lAnswer : String = self.myFlashCardModel!.getAnswer()
        
        self.answerLabel.text = lAnswer
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

