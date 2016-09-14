import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var messageLabel:UILabel!
    @IBOutlet var tabsLabel:UILabel!
    @IBOutlet var touchesLabel:UILabel!
    
    func updateLabelsFromTouches(touches: NSSet) {
        let theTouchObject = touches.anyObject() as! UITouch
        let theNumOfTaps = theTouchObject.tapCount
        let theTapsMessage = "\(theNumOfTaps) taps detected in sequence"
        self.tabsLabel.text = theTapsMessage
        let theNumOfTouches = touches.count
        let theTouchMessage = "\(theNumOfTouches) touches detected at once"
        self.touchesLabel.text = theTouchMessage
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let firstTouch = touches.first {
            
            let gestureStartPoint = firstTouch.locationInView(self.view)
            self.messageLabel.text = "Touches Begin at \(gestureStartPoint.x), \(gestureStartPoint.y)"
        }
        updateLabelsFromTouches(event!.allTouches()!)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.messageLabel.text = "Touches Moved"
        updateLabelsFromTouches(event!.allTouches()!)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.messageLabel.text = "Touches End"
        updateLabelsFromTouches(event!.allTouches()!)
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        self.messageLabel.text = "Touches Cancelled"
        updateLabelsFromTouches(event!.allTouches()!)
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

