//: [Previous](@previous)

import Foundation

/*
 Remove duplicates from the array.
 Example Input1 -> [1,2,4,2,1,4,5]
 Example Input2 -> 7

 Example OutPut -> [1,2,4,5]

 Here it is cleary mention in the question that order need to be maintained
 
enum EmptyReturn : Error {
    case EmptyReturnValue
}

func removeDuplicates(input1: [Int], input2: Int) throws -> [Int] {
    throw EmptyReturn.EmptyReturnValue
}
 */

enum EmptyReturn : Error {
    case EmptyReturnValue
}


func removeDuplicates(input1: [Int], input2: Int) throws -> [Int] {
 
    var dict = [Int : Int]()
    var indexs = [Int]()
    
    for i in 0..<input2 {
        if dict[input1[i]] == nil {
            dict[input1[i]] = i
            indexs.append(i)
        }
    }
    
    var ansArray : [Int] = []
    for index in indexs {
        ansArray.append(input1[index])
    }
    
    return ansArray
    
}

print(removeDuplicates(input1: [1,2,4,2,1,4,5], input2: 7))
