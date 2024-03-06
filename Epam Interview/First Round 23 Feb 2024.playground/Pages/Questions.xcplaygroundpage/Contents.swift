/*
 1. Can you introduce yourself?
 2. What are the differences between a class and a struct in Swift?
 3. Does a struct typically consume more memory compared to a class?
 4. What are Associated Values in Enum, and what benefits do they provide?
 5. Can you explain Associated Type in Swift?
 6. How do we determine the data type in an Associated Type?
 7. Can you define what a generic type is? (I mentioned that generic is polymorphism)
 8. Could you provide an example of a generic function? What is happening in the provided example, and what is its return type?
 ----------------------------------------------------------------------
 func tuv<T, U, V> (_ f: @escaping (T) -> U, _ g: @escaping (U) -> V) -> (T) -> V {
 
 }
 let test = tuv({%0 * 2}, {$0 + 2})
 ----------------------------------------------------------------------
 9. What will be the output of the given code snippet?
 ----------------------------------------------------------------------
 
 func addCount(forCount amount: Int) -> () -> Int {
 var total = 0
 func counter() -> Int {
 total += amount
 return total
 }
 return counter
 }
 print(addCount(forCount: 10))
 let countByTen = addCount(forCount: 10)
 print(countByTen())
 
 ----------------------------------------------------------------------
 
 10. In SwiftUI, what are Opaque Types?
 11. What is a property wrapper?
 12. What does it mean to conform to a protocol?
 13. What is the default definition of a protocol in Swift?
 14. What is Concurrency?
 15. Can you explain what GCD (Grand Central Dispatch) is?
 16. What are the differences between GCD and Operation in iOS?
 17. Can you explain what a dispatch group is in GCD?
 18. In modern concurrency, how does Async/Await differ from traditional approaches?
 19. How do you convert a closure to Async/Await?
 20. How can you add dependency in Async/Await? For example, ensuring that a fourth operation happens after the completion of three.
 21. Have you created views programmatically in coding?
 22. How have you managed views for iPhone and iPad in gaming?
 23. What different architectures have you worked with?
 24. Can you explain MVVM?
 25. In MVVM, how does data reach the view?
 26. What does Combine do exactly?
 27. What are the different types of subscribe?
 28. How do you save a dictionary in Core Data?
 29. When is migration used in Core Data?
 30. When do we need lightweight migration in Core Data?
 31. How do you perform testing?
 32. Are you familiar with any third-party tools for unit testing?
 33. How do you test an async function in unit testing using expectations?
 34. Have you worked with TDD (Test-Driven Development)?
 35. Have you worked with BDD (Behavior-Driven Development)?
 36. How do you debug when your home view is loading slowly?
 37. What is a lazy property?
 38. What is the issue in the given code snippet?
 --------------------
 lazy let a = 10.
 --------------------
 
 39. How do you conduct code reviews?
 40. Are you familiar with Jenkins?
 41. How do you perform version control?
 42. Have you led a team before?
 43. How do you manage a sprint backlog?
 44. What would you do if you had to implement a framework you're not familiar with?
 45. Given two frameworks, how would you choose which one to use?
 46. Can you describe a recent or past project where you faced difficulty?
 47. What does 'I' stand for in SOLID principles?
 
 */
