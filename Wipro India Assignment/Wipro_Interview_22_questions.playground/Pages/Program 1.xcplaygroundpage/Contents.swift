
/*
 Remove duplicates from the array.
 Example Input -> [1,2,4,2,1,4,5]
 Example OutPut -> [1,2,4,5]
 Mistake usally done is - while returing order is not maintained
 
enum EmptyReturn : Error {
    case EmptyReturnValue
}

func removeDuplicates(input: [Int] ) throws -> [Int] {
    throw EmptyReturn.EmptyReturnValue
}
 */


//If order is not required
func removeDuplicates(input: [Int] ) throws -> [Int] {
    return Array(Set(input))
}
print(removeDuplicates(input: [1,2,4,2,1,4,5]))
