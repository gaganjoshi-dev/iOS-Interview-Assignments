/*
 I had a Online interview with Wipro on 9th Feb, 2024
 Given below are the question I was asked
 
 I said SwiftUi slower than UIKIt -> I need to be sure
 May be you adabting is swift UI Slow
 
 */

/*
 These are th question asked?

 1. Can you introduce yourself?
 2. How many years of experience do you have in Swift, iOS, and SwiftUI respectively?
 3. Are you currently working on SwiftUI projects?
 4. In your opinion, is SwiftUI faster than UIKit?
 5. What architecture patterns have you worked with?
 6. How do you decide which architecture pattern to use for a project and what parameters do you consider when choosing one?
 7. Have you ever created a framework?
 8. Have you worked with RxSwift or Combine?
 9. How much experience do you have with deployment processes, specifically related to the App Store?
 10. Are you familiar with profiling tools like Instruments?
 11. How do you typically test the performance of your apps and have you used any third-party frameworks for this purpose?
 12. How do you ensure the reusability of components in your projects?
 13. Do you have experience with SOLID principles, particularly dependency inversion, and what are the advantages of dependency inversion, specifically in terms of unit testing?
 14. Have you written UITestCases before?
 15. Do you have experience in team management, and if so, for how many years?
 16. Are you familiar with Agile methodologies and the process of picking storyboards?
 17. Why is Swift considered a protocol-oriented language?
 18. Why is it recommended to use more value types in Swift?
 19. How are value types managed in memory compared to reference types?
 20. What is a retain cycle and how do weak and unowned references differ?
 21. Which one is faster: weak or unowned references?
 22. Can you explain what closures are?
 23. What is the output of the code snippet below (closure question)?
 24. What is the output of below code (closure question)
----------------------------------------------------------
 var a = 6
 var b = 9

 let printSum: (_ a: Int, _ b: Int) -> () = { a,b in
     print(a + b)
 }
 a = 3
 b = 3
 printSum(a,b)
 ----------------------------------------------------------
 25. What is the output of below code (GCD Question)
 ----------------------------------------------------------
 print(2)
      DispatchQueue.main.sync {
         print(3)
     }
 }
 print(4)
 ----------------------------------------------------------
 26. What is the output of below code (Equatable Protocol)
 ----------------------------------------------------------
 var A = Cordinate(x : 10, y : 20)
 var B = Cordinate(x : 10, y : 20)
 if A == B {
   print("both are equal")
 }
 else {
 print("both are not equal")
 }
 ----------------------------------------------------------

 27. What are access specifiers in Swift?
 28. If I have two different classes in the same file and I define on property as file-private in one class, can I use it in another class in the same file?
 29. Can I use a privately declared property in an extension?
 30. Is it possible to write properties in a protocol?
 31. Can I define a property like var = "gagan" directly in a protocol?
 32. Can properties be declared in extensions?
 33. Are value types more reliable?
 34. If I am using many value types, will it affect performance?
 35. Why do we write mutating in front of a function?
 36. What is the difference between Sync, Async, serial, and concurrent execution?
 37. What is the difference between serial and concurrent execution in detail?
 38. What are the differences between Dispatch.sync and Dispatch.async?
 39. Is the main thread in Swift single-threaded?
 40. What is the use of main.async if it is a single thread?
 41. What are Lazy properties?
 42. Are lazy properties thread-safe?
 43. Do you know about dependency injection?
 44. What are the types of dependency injection?
 
 
 
 */



class SomeClass {
    
    static var someInt : Int = 5
}


SomeClass.someInt = 15

print(SomeClass.someInt)

