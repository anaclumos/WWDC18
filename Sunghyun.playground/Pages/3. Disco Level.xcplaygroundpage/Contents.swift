/*:
 [Previous](@previous) | [Next](@next)
 - - -
 ## Definition of the Disco Level
In order to compare the accuracy more easily, I made a special **mathematical indicator** to compare these more easily. It is called the **Disco Level** (Solely designed by myself 🙏)
 - - -
 - Note:
  Disco level shows the numbers of "9". We can use Logarithm to calculate this.
    - Accuracy: 90% ➡️ Disco Level 1
    - Accuracy: 99% ➡️ Disco Level 2
    - Accuracy: 99.9% ➡️ Disco Level 3
    - Accuracy: 99.9991538% ➡️ Disco Level 5.073
 - - -
  - Important: **Higher disco level** directly translates to **higher accuracy**.
 
For comparing the accuracy, We will use this for visual ease.
 (Why the name is disco level? Because I was listening to disco music when I came up with this idea 😆)
 - - -
 - Experiment: Input a number next to `accuracy`. Check the results on the console.
 */
var check = Disco()
print(check.disco(accuracy: 0.9))
print(check.disco(accuracy: 0.99))
print(check.disco(accuracy: 0.999))
print(check.disco(accuracy: 0.999991538))
/*:
- - -
[Previous](@previous) | [Next](@next)
 */
