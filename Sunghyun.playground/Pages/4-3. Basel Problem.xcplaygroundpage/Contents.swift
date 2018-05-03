import UIKit
import PlaygroundSupport
/*:
 [Previous](@previous) | [Next](@next)
 ### Live View Enabled Page
 - - -
 ## Method 3. Basel Problem
 The Basel problem uses ***Taylor series expansion of the sine function*** to calculate π.
 
 Simplifying the result, π can be represented as the following. Note that the divisor is each natural number squared.
 - Note: (π^2)/6 = 1 + 1/4 + 1/9 + 1/16 + 1/25 + ...
 
 Wait, ***Taylor*** series in ***Swift***? 🤣
 - Experiment: Let's make an `Basel` Object to ***visually*** check the results!
 */
//: First, decide the `trial` number. As the `trial` increases, the Disco Level will increase (i.e. more precise pi result.) Also in this case, if the trial increase 10 times, the Disco level approximately increases by 1. This is because **Disco Level uses logarithm with base 10**.
var trial : Int = 100
//Change the trial value, and check the results.
//Note that more trials means longer calculation time.

var basel = Basel(trial: trial)
//: Let's make a `Graph` object called `chart`, and add the axes' titles.
let chart = Graph(width: 600, height: 600, padding: 50.0, xAxisMin: 0.0, xAxisMax: Double(trial), yAxisMin: 0.0, yAxisMax: 4.5)
chart.drawAxes(xAxisTitle: "Trials", yAxisTitle: "π Result")
//: Then, decide the color to display this chart.
var baselColor: UIColor = UIColor.green
//: Let's display the chart on the live view, and check the results!
PlaygroundPage.current.liveView = chart
//Displaying chart on live view

chart.showGuideLine()
chart.graphPi(graph: basel.getAll(), graphColor: baselColor)
chart.addLabel(at: Dot(x: chart.xAxisMax.x,y: basel.getPi() + 0.3), text: "Basel", color: baselColor)
//Adjustments for visual ease

print("Result Pi: \(basel.getPi())")
print("Disco Level: \(+basel.getDisco())")
//Printing results on the console
/*:
 - Important: If the `trial` is same, the result will not vary. This is because ***Basel Problem*** doesn't rely on random number.
 - - -
 [Previous](@previous) | [Next](@next)
 */
