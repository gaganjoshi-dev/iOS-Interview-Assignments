import Foundation
/*
 Question 3. What is Bunddle
 
 1. It is a Class
 2. It is Used to Send Data
 3. It is Folder with .app extension
 4. None of the above
 
 My ans - option 1

 */

let bundle = Bundle()


/*
 Question 4. What is problem in below code

 struct Struct1 {
     var rollno : Int
     
     func increment()  {
         rollno += 1
     }
 }
 1. Increment() method should be marked as mutating as it is changing the struct's own variable
 2. Increment() method cannot change struct's own variable value
 3. Struct definition is wrong struct keyword should start with a capital letter
 4. Struct is missing its initializer
 
 My ans - option 1
 */



/*
 Question 5. Which Statement is true about main thread?
 
 1. The Main Thread is responsible for executing time-consuming tasks to avoid blocking the UI.
 2. All UI updates and user interactions must happen on the Main Thread.
 3. Background tasks can be performed directly on the Main Thread without any impact on UI responsiveness
 4. The Main Thread is automatically created and managed by the operating system and cannot accessed directly
 
 My ans -> option 2.
 */




/*
 Question 6. What are collection types or value types in Swift
 
 1. Array and Library
 2. Dictionary and Array
 3. Dictionary and Library
 4. Library, Dictionary and Array
 
 
 My ans -> option 2.

 */

/*
 Question 7. Which Statement is true about memory management in Swift
 
 1. iOS uses Automatic Reference Counting (ARC) to manage memory automatically.
 2. Manual memory management is required in iOS to handle memory deallocation.
 3. Memory management is handled by the operating system, and developers have no control over it.
 4.  iOS uses garbage collection for memory management, similar to other programming languages.
 
 
 My ans -> option 1.

 */

/*
 Question 8. It was a simple true , false question - don't remember
 
 1. True
 2. False
 3. Can be true or false
 4. Can not say
 
 
 My ans -> option 1.

 */

/*
 Question 9. _________ is the hierarchy of events. Somewhat similar question don't remember exactly.
 
 1. Regular Expression
 2. Dictionary
 3. Responder Chain
 4. None of the above
 
 
 My ans -> Option 3.

 */

/*
 Question 10. Difference between struct and class in Swift?
 
 1. A class is a reference type, and a struct is a value type.
 2. A class can inherit from another class, and a struct can't.
 3. A class has a default initializer, and a struct doesn't.
 4. A class is used for storing data, and a struct is used for defining behavior.
 
 
 My ans -> option 1.
 
 However option 2 was also correct but it was single choice

 */

/*
 Question 11. Choose Control Flow Statement or Control Transfer Statement or Control Break Statment.
 
 1. break
 2. continue
 3. fallthrough
 4. All of above
 
 
 My ans -> option 4.

 */

/*
 Question 12. What will you choose to return multiple value form the function.
 
 1. Tuple
 2. Array
 3. Both 1 & 2
 4. None of the above
 
 
 My ans -> option 3.

 */


/*
 Question 13. Which one is not the persistence storage in iOS?
 
 1. UserDefaults
 2. SQLite
 3. Core Data
 4. HTTP Cookies
 
 My ans -> option 4.

 */



var string = ""
string.uppercased()
/*
 Question 14. how to convert a string to uppercase in Swift?
 
 1. string.uppercased()
 2. string.upper()
 3. string.uppercase()
 4. string.toUppercase()
 
 My ans -> option 1.

 */



/*
 Question 15. What is escaping closure?
 
 1. A closure that captures and stores references to any constants and variables from the context in which it is defined.
 2. A closure that can be passed as an argument to another function and executed asynchronously.
 3. A closure that is guaranteed to execute immediately when it is called.
 4. A closure that is only executed if a certain condition is met.
 
 My ans -> option 2.

 */





/*
 Question 16. How to break the retain cycle or Cyclic Retain dependency in below Code?
 
 1. Weak reference: weak var someClass2: SomeClass2!
 2. Unowned reference: unowned let someClass1: SomeClass1
 3. Both of the given options
 4. None of the given options
 
 My ans -> option 1.
 But I feel right answer was option 3
 */

class SomeClass1 {
    var someClass2 : SomeClass2
    
    init(someClass2: SomeClass2) {
        self.someClass2 = someClass2
    }
}

class SomeClass2 {
    var someClass1 : SomeClass1
    
    init(someClass1: SomeClass1) {
        self.someClass1 = someClass1
    }

}



/*
 Question 17. The below code will give error in which line
 
 1. Both 2 and 3.
 2. Both 3 and 8
 3. Both 8 and 9
 4. No errors
 
 My ans -> option 3.
But my answers is wrong, it will not show error on line 9.
 It there is initializer , it will show error on initializer
 So I think 2 is the correct answer - 3 must be the initializer
 */

//struct SomeStruct { //1
//    var value : Int //2
////    init(value: Int) { //4
////        self.value = value
////    }
//    func printTheString(string: String)  { //3
//        print(string)
//    }
//}

//var someStruct = SomeStruct() // 8
//someStruct.printTheString(string: "Hello") // 9

/*
 Question 18. What one is not a value type in Swift?
 
 1. Double
 2. Character
 3. Enum
 4. class
 
 My ans -> option 4.

 */

/*
 Question 19. Which of the statment is true about weak vs strong
 
 1. A weak reference does not keep a reference count of an object, while a strong reference
 2. A weak reference can be nil, while a strong reference cannot.
 3. A weak reference is used to avoid retain cycles, while a strong reference is used to keep an object alive.
 4. All of the above.
 
 My ans -> option 4.

 */


/*
 Question 20. App is in the foreground but not receiving any events. Which state app is in?
 
 1. Background State
 2. Inactive State
 3. Suspended State
 4. Active State
 
 My ans -> option 2.

 */

/*
 Question 21. What will be the output of below code
 
 1. nil
 2. ["one", "two", "three", "four", "five"]
 3. ["six", "seven", "eight", "nine", "ten"]
 4. ["five", "six", "seven", "eight", "nine"]
 
 My ans -> option 3.

 */

let words = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"]

print(words[5..<10])



/*
 Question 22. Difference Between let and var
 
 1. let is used for constants, and var is used for variables.
 2. let is used for variables, and var is used for constants.
 3. let is used for defining functions, and var is used for defining properties.
 4. There is no difference between let and var in Swift.
 
 My ans -> option 1.

 */
