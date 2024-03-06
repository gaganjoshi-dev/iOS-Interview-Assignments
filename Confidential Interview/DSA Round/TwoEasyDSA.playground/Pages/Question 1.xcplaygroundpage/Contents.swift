//Question 1
import Foundation

/*
 
 Dated june 2023
 This is the first question , Time given was 15 min.
 I did that, was easy
 
 Task Description
 A vending machine has the following denominations: 1c, 5c, 10c, 25c, 50c, and $1. Your task is to write a program that will be used in a vending machine to return change. Assume that the vending machine will always want to return the least number of coins or notes. Devise a function getChange(M, P) where M is how much money was inserted into the machine and P the price of the item selected, that returns an array of integers representing the number of each denomination to return.

 Example:
 getChange(5, 0.99) // should return [1,0,0,0,0,4]

 getChange(3.14, 1.99) // should return [0,1,1,0,0,1]
 getChange(3, 0.01) // should return [4,0,2,1,1,2]
 getChange(4, 3.14) // should return [1,0,1,1,1,0]
 getChange(0.45, 0.34) // should return [1,0,1,0,0,0]
 
 */

func getChange(total: Double,purchased: Double) -> [Int] {
    
    var answer = String(format: "%.2f", total - purchased)
    let array = answer.components(separatedBy: ".")
    
    var answerArray = Array(repeating: 0, count: 6)
    answerArray[5] = Int(array[0])!
    
    if array.count == 1 {
        return answerArray
    }
    
    var secondPart = Int(array[1])!
    
    if secondPart == 50 {
        answerArray[4] = 1
        return answerArray
    }
    
    if secondPart > 50 {
        answerArray[4] = 1
       secondPart = secondPart % 50
    }
    
    if secondPart == 25 {
        answerArray[3] = 1
        return answerArray
    }
    
    if secondPart > 25 {
        answerArray[3] = 1
       secondPart = secondPart % 25
    }
    
    if secondPart == 10 {
        answerArray[2] = 1
        return answerArray
    }
    
    if secondPart > 10 {
       answerArray[2] = secondPart / 10
       secondPart = secondPart % 10
    }
    
    if secondPart == 5 {
        answerArray[1] = 1
        return answerArray
    }
    
    if secondPart > 5 {
        answerArray[1] = 1
       secondPart = secondPart % 5
    }
    
    answerArray[0] = secondPart
    
   
    
    return answerArray
}


var a : Double = 3 , b = 0.01
/*
getChange(3.14, 1.99) // should return [0,1,1,0,0,1]
getChange(3, 0.01) // should return [4,0,2,1,1,2]
getChange(4, 3.14) // should return [1,0,1,1,1,0]
getChange(0.45, 0.34) // should return [1,0,1,0,0,0]
*/



print(getChange(total: a, purchased: b))

