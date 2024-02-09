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
 
 
 
 
 */

enum EmptyReturn : Error {
    case EmptyReturnValue
}

//remove duplicate from unsorted array , maintain the order
// used set - time complexity O(N) and space complexity O(N)
func removeDuplicatesUnsortedArray(input1: [Int], input2: Int) throws -> [Int] {
    
    var set : Set<Int> = []
    var ansArray : [Int] = []
    for i in 0..<input2 {
        if !set.contains(input1[i]) {
            set.insert(input1[i])
            ansArray.append(input1[i])
        }
    }
    return ansArray
    
}

print(removeDuplicatesUnsortedArray(input1: [1,7,9,2,4,2,1,4,5,7,9], input2: 11))

//If you are given sorted array than use 2 pointer approch
//remove duplicate from sorted array , maintain the order
func removeDuplicatesSortedArray(input1: [Int], input2: Int) throws -> [Int] {
    
    var array = input1
    var k = 1
    var numberOfTimesLoopruns = 0
    for index in 1..<array.count where array[index] != array[k - 1] {
        array[k] = array[index]
        k += 1
        print("print indexs = \(index)")
        numberOfTimesLoopruns += 1
    }
    print(numberOfTimesLoopruns)
    return Array(array[0..<k])
    
}

print(removeDuplicatesSortedArray(input1: [0,0,1,1,1,3,5,5,7,8,8], input2: 11))



func removeDuplicatesSortedArray2(input1: [Int], input2: Int) throws -> [Int] {
    
    var array = input1
    var st = 0
    var en = 1
    var numberOfTimesLoopruns = 0

    while (en < array.count) {
        if (array[st] == array[en]){
            en+=1
        }else {
            st+=1
            array[st] = array[en]
            en+=1
        }
        numberOfTimesLoopruns += 1

    }
    print(numberOfTimesLoopruns)

    return Array(array[0..<st+1])
    
}

print(removeDuplicatesSortedArray2(input1: [0,0,1,1,1,3,5,5,7,8,8], input2: 11))





