import UIKit
import PlaygroundSupport
let graph = Graph(width:600.0,height:600.0,padding:50.0,xAxisMin:-1.0,xAxisMax:1.0,yAxisMin:-1.0,yAxisMax:1.0)
/*:
 [Previous](@previous) | [Next](@next)
 ### Live View Enabled Page
 - - -

 ## Method 1. Monte Carlo Method
 
 Monte Carlo Method refers to a method that uses a **massive amount** of input to achieve a **specific output**. Since it can rely on mathematical repetition, it is mostly used in complex problems that cannot be approached analytically. The key point is "**more input, more precise.**" Let's use Monte Carlo Method to calculate π.
 
 - Experiment:Let's make an `MonteCarlo` object to visually check the Monte Carlo Calculation Process on ***live view***!
 */
var trial : Int = 10000
//Change the trial value, and check the results.
//Note that more trials means longer calculation time.

var monte = MonteCarlo(trial: trial, on: graph)
/*:
 As the `trial` increases, the ratio of **dots inside the circle** to **all dots** will approach the ratio of **area of the circle** to the **area of the enclosing square** as the trial increases. Using this fact, we can calculate π.
 
 Let's display the graph on the live view, and check the results!
 */
PlaygroundPage.current.liveView = graph
//Displaying graph on live view

graph.drawAxes(xAxisTitle: "x", yAxisTitle: "y")
graph.addCircle(at: graph.origin, radiusInPixel: 250, color: UIColor.red)
//Adjustments for visual ease

print("Result Pi: \(monte.getPi())")
print("Disco Level: \(+monte.getDisco())")
//Printing results on the console
/*:
 - Important: Try several times with the same `trial` number. Since it randomly generates number, the **result vary every time**.
 - - -
 [Previous](@previous) | [Next](@next)
 */


