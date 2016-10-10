import Foundation

class FlashCardModel {
    var questionsArray =
        [0: "What is your name?",
         1: "What is 42?",
         2: "What is the color of the sky?"]
    
    var answersArray =
        [0: "My name is not important",
         1: "It's 6 times 7",
         2: "Kinda gray today"]
    
    var current = 0
    
    init() {
    }
    
    func getNextQuestion() -> String {
        current += 1
        if (current >= questionsArray.count) {
            current = 0
        }
        return questionsArray[current]!
    }
    
    func getAnswer() -> String {
        return answersArray[current]!
    }
}