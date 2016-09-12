//: Playground - noun: a place where people can play

//A
import UIKit

class HW03 {
func switf_example() -> (String) {
    let glassesStatus = "new"

    switch glassesStatus {
        case "scratched":
            let glassesOrder = "Add scratch resistant coating"
        case "cant read":
            let glassesOrder = "Take a vision test."
    default:
        let glassOrder = "Enjoy your new glasses."
    }
    return glassesStatus
}
//Error Definition conflicts with previoud value
//Cannot assign to value 'glassStatus' is a 'let' constant

//B
func twoThings(x: Float, y: Float) -> (a:Float,b:Float) {
    return(x*y, x + y)
}

//print(twoThings(1.00, y: 2.00))
//(2.0, 3.0)
//print(twoThings(1.00, y: 4.00))
//(4.0, 5.0)

//C
func fib(x:Int)->Array<Int>{
    var ls = [1, 1]
    var i1 = 1
    var i2 = 1
    var o = 0
    for i in 1...x {
        if (i > x) {
            break
        }
        o = i2
        i2 = i1 + i2
        ls.append(i2)
        i1 = o
    }
    
    return ls
}

//print(fib(10))
//[1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]
//print(fib(20))
//[1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765, 10946, 17711]

//D
}
class HW102: HW03{
    
    print(twoThing(23.01, 20.30))
    
}
