import UIKit
import PlaygroundSupport
/*:
 [Previous](@previous) | [Next](@next)
 ### Live View Enabled Page
 - - -
 ## Which one is the most accurate method?
 
 - Experiment: Now, you'll compare each way to calculate π visually, using `Graph` object.
 - - -
 - Important: We will use **disco level** to compare the accuracy. *Remember*, **higher disco level** means **more accurate result**.
 */
//: First, let's make `MonteCarlo`, `Leibniz`, and `Basel` object to calculate the result.
var trial : Int = 1000
//Change the trial value, and check the results.
//Note that more trials means longer calculation time.

var monte = MonteCarlo(trial: trial)
var leibniz = Leibniz(trial: trial)
var basel = Basel(trial: trial)
//: Let's make a `Graph` object called `chart`, and add the axes' titles.
let chart = Graph(width: 600, height: 600, padding: 50.0, xAxisMin: 0.0, xAxisMax: Double(trial), yAxisMin: 0.0, yAxisMax: log10(Double(trial))+2.5)
chart.drawAxes(xAxisTitle: "Trials", yAxisTitle: "Disco Level")
//: Change the color of the graph, if you'd like to.
var monteColor : UIColor = UIColor.red
var leibnizColor : UIColor = UIColor.blue
var baselColor : UIColor = UIColor.green
//: Let's display the chart on the live view, and check!
PlaygroundPage.current.liveView = chart

chart.showGuideLine()
chart.graphDisco(graph: monte.getAll(), graphColor: monteColor)
chart.graphDisco(graph: leibniz.getAll(), graphColor: leibnizColor)
chart.graphDisco(graph: basel.getAll(), graphColor: baselColor)
chart.addLabel(at: Dot(x: chart.xAxisMax.x,y: monte.getDisco() - 0.3), text: "Monte", color: monteColor)
chart.addLabel(at: Dot(x: chart.xAxisMax.x,y: leibniz.getDisco() - 0.3), text: "Leibniz", color: leibnizColor)
chart.addLabel(at: Dot(x: chart.xAxisMax.x,y: basel.getDisco() + 0.3), text: "Basel", color: baselColor)
//Adjustments for visual ease

print("Result Pi: \(monte.getPi())")
print("Disco Level: \(+monte.getDisco())")
print("\nResult Pi: \(leibniz.getPi())")
print("Disco Level: \(+leibniz.getDisco())")
print("\nResult Pi: \(basel.getPi())")
print("Disco Level: \(+basel.getDisco())")
//Printing results on the console
/*:
 - Note: Try several times. Since Monte Carlo Method rely on random number generating, the graph will fluctuate a lot.
 - - -
 [Previous](@previous) | [Next](@next)
 */
