import UIKit

/*
 It was Technical + Manager round
 */

/*
 1. Could you introduce yourself?
 2. What is your current role?
 3. Have you worked in the capacity of an architect?
 4. What is your total experience?
 5. Have you managed any teams before?
 6. What does your day-to-day activity look like or what do you do every day?
 7. Have you worked with SwiftUI?
 8. What are the benefits of SwiftUI?
 9. Do you have any experience working with a multi-team setup, including a backend team, product owner, business team, and technical team?
 10. When coordinating within a team and writing requirements, what challenges have you experienced? What are typical tasks you perform in that role?
 11. If you have an app published on the App Store, and a backend team member changes the API such that integer parameters are now returned as strings and vice versa, how would you handle this? What would be your design parameters or strategy to address this issue?
 12. Have you used MVVM? What are the demerits of the MVVM design pattern?
 13. What is the coordinator design pattern?
 14. Have you worked with RxSwift?
 15. What does Combine do?
 16. How would you find the sum of the squares of even numbers in an array using higher-order functions only?
 
 /* My answer
 var array : [Int] = [1,2,3,4,5]

 array = array.filter { $0 % 2 == 0 }

 var sum = 0

 for value in array where value % 2 == 0 {
     sum += value * value
 }
 print(sum)
 */



 /*
  Expected answer
  var array : [Int] = [1,2,3,4,5]

  var ans = array.filter { $0 % 2 == 0 }.map{ $0 * $0 }.reduce(0,+)

  print(ans)
  
  */
  
 /*
 This is the most optimised answer
 var array : [Int] = [1,2,3,4,5]

  var sum = 0

  for value in array where value % 2 == 0 {
      sum += value * value
  }
  print(sum)
  */

 
 
 
 
 17. What is a closure?
 18. Do you have experience with actors?
 19. How do you conduct unit testing?
 20. Suppose you need to perform unit testing for data downloaded from the server. What would be your strategy?
 21. How do you conduct code reviews?
 22. What is the difference between an array in Objective-C and an array in Swift?
 23. How do you pass data to the UI in the MVVM design pattern?
 */



