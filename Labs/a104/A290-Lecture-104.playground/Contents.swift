// A290 - Fall 2016 - Mitja Hmeljak

import UIKit

// let's create a class
class smartForm {
    // these are properties (i.e. instance variables)
    //    they must have declared values,
    //    either here or in the initializer function:
    let firstName: String
    let lastName: String
    var fullName: String
    
    // the initializer function/method:
    init(aFirstName:String, aLastName:String) {
        // this is how a class property is assigned a value:
        self.firstName = aFirstName
        self.lastName = aLastName
        // "self." is optional if unequivocal:
        fullName = firstName + " " + lastName
    }
    
    // proper indentation is not compulsory ...but it's useful:
    func buildFullName(title: String) -> String {
        return (title+fullName)
    } // this indentation is less readable
    
    // methods are just like functions:
    func printFullName() {
        var theTitle = "Someone"
        if self.firstName == "Thursday" {
            theTitle = "Ms."
        } else {
            theTitle = "Mr."
        }
        
        // string interpolation can get a bit more elaborate:
        print("hello, \(buildFullName(theTitle))")
    }
    
}

// create an instance of the smartForm() class and use it:
let useTheForm = smartForm(aFirstName: "Friday", aLastName: "Parke-Laine")
// this won't work because we need to name arguments:
//    let useTheForm = smartForm("Friday", "Parke-Laine")

// create an instance of the smartForm() class and use it:
let aSecondForm = smartForm(aFirstName: "Thursday", aLastName: "Next")

useTheForm.printFullName()
aSecondForm.printFullName()


