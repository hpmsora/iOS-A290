import UIKit

class ViewController: UIViewController {

    //add the model
    let myFlashCardModel = FlashCardModel()
    
    //initially, no question has been asked:
    var aQeustionIsAsked = false
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    //two methods to handle button events:
    // "@IBAction tells Xcode to list these methods as "Available Actings"
    //  and they can be connected using IntergaceBuilder:
    @IBAction func showQuestion(sender: UIButton) {
        
        let lQuestion : String = myFlashCardModel.getNextQuestion()
        
        self.questionLabel.text = lQuestion
        self.answerLabel.text = "(try guessing...)"
    }

    @IBAction func showAnswer(sender: UIButton) {
        
        let lAnswer : String = myFlashCardModel.getAnswer()
        
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

