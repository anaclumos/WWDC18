import UIKit
import PlaygroundSupport
/*:
 [Previous](@previous) | [Next](@next)
 ### Live View Enabled Page
 - - -
 ## Method 2. Leibniz Formula
 Named after the famous *Gottfried Wilhelm Leibniz*, Leibniz Formula uses ***infinite addition*** to approach π. It can be described as the following.
 - Note: (π/4) = 1 - 1/3 + 1/5 - 1/7 + 1/9 - ...
- - -
 - Experiment: Let's make an `Leibniz` Object to ***visually*** check the results!
 */
//: First, decide the `trial` number. As the `trial` increases, the Disco Level will increase (i.e. more precise pi result.) As trial increase 10 times, the Disco level increases by 1. This is because **Disco Level uses logarithm with base 10**.
var trial: Int = 100
//Change the trial value, and check the results.
//Note that more trials means longer calculation time.

var leibniz = Leibniz(trial: trial)
//: Let's make a `Graph` object called `chart`, and add the axes' titles.
let chart = Graph(width: 600, height: 600, padding: 50.0, xAxisMin: 0.0, xAxisMax: Double(trial), yAxisMin: 0.0, yAxisMax: 4.5)
chart.drawAxes(xAxisTitle: "Trials", yAxisTitle: "π Result")
//: Then, decide the color to display this chart.
var leibnizColor: UIColor = UIColor.blue
//: Let's display the chart on the live view, and check the results!
PlaygroundPage.current.liveView = chart
//Displaying chart on live view

chart.showGuideLine()
chart.graphPi(graph: leibniz.getAll(), graphColor: leibnizColor)
chart.addLabel(at: Dot(x: chart.xAxisMax.x,y: leibniz.getPi() - 0.3), text: "Leibniz", color: leibnizColor)
//Adjustments for visual ease

print("Result Pi: \(leibniz.getPi())")
print("Disco Level: \(+leibniz.getDisco())")
//Printing results on the console
/*:
 - Important: If the `trial` is same, the result will not vary. This is because ***Leibniz Formula*** doesn't rely on random number.
 - - -
[Previous](@previous) | [Next](@next)
 */
