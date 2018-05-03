import UIKit
import PlaygroundSupport

public class Graph : UIView {
    public var width : Double
    public var height : Double
    public var padding : Double
    public var xAxisMax : Dot
    public var xAxisMin : Dot
    public var yAxisMax : Dot
    public var yAxisMin : Dot
    public let origin : Dot
    
    public init(width: Double, height: Double, padding: Double, xAxisMin: Double, xAxisMax: Double, yAxisMin: Double, yAxisMax: Double) {
        self.width = width
        self.height = height
        self.padding = padding
        self.xAxisMax = Dot(x: xAxisMax, y: 0.0)
        self.xAxisMin = Dot(x: xAxisMin, y: 0.0)
        self.yAxisMax = Dot(x: 0.0, y: yAxisMax)
        self.yAxisMin = Dot(x: 0.0, y: yAxisMin)
        self.origin = Dot(x: 0, y: 0)
        super.init(frame: CGRect(x:0, y:0, width: width, height: height))
        self.backgroundColor = UIColor.white
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func drawAxes(xAxisTitle: String, yAxisTitle: String) {
        addLine(from: self.xAxisMin, to: self.xAxisMax, color: UIColor.black)
        addLine(from: self.yAxisMin, to: self.yAxisMax, color: UIColor.black)
        self.addLabel(at: Dot(x: xAxisMax.x, y:(-(yAxisMax.y-yAxisMin.y)/50)), text: "\(xAxisTitle)", color: UIColor.black)
        self.addLabel(at: Dot(x: 0, y: 1.5*(yAxisMax.y-yAxisMin.y)/50+(yAxisMax.y)), text: "\(yAxisTitle)", color: UIColor.black)
        self.addLabel(at: Dot(x: -(xAxisMax.x-xAxisMin.x)/50, y: (-(yAxisMax.y-yAxisMin.y)/50)), text: "0", color: UIColor.black)
    }
    
    public func showGuideLine() {
        for y in 1...Int(yAxisMax.y) {
            addLine(from: Dot(x: xAxisMin.x, y: Double(y)), to: Dot(x: xAxisMax.x, y: Double(y)), color: UIColor.gray)
            self.addLabel(at: Dot(x: -(xAxisMax.x/50), y: Double(y)), text: "\(y)", color: UIColor.gray)
        }
        for n in 1...4 {
            addLine(from: Dot(x: Double(n)*xAxisMax.x/5, y: yAxisMin.y), to: Dot(x: Double(n)*xAxisMax.x/5, y: yAxisMax.y), color: UIColor.gray)
            self.addLabel(at: Dot(x: Double(n)*xAxisMax.x/5, y: -1.5*((yAxisMax.y-yAxisMin.y)/50.0)), text: "\(Int(Double(n)*xAxisMax.x/5))", color: UIColor.gray)
        }
    }
    
    public func graphDisco(graph: [Double], graphColor: UIColor)
    {
        var dots : [Dot] = []
        for n in 0...graph.count-1 {
            dots.append(Dot(x: Double(n)*xAxisMax.x/Double(graph.count), y: disco(of: graph[n])))
        }
        for x in 0...dots.count-1 {
            addCircle(at: dots[x], radiusInPixel: 1, color: graphColor)
        }
    }
    
    public func graphPi(graph: [Double], graphColor: UIColor)
    {
        addLine(from: Dot(x: xAxisMin.x, y: Double.pi), to: Dot(x: xAxisMax.x, y: Double.pi), color: UIColor.gray)
        self.addLabel(at: Dot(x: -(xAxisMax.x/50), y: Double.pi), text: "π", color: UIColor.gray)
        var dots : [Dot] = []
        for n in 0...graph.count-1 {
            dots.append(Dot(x: Double(n)*xAxisMax.x/Double(graph.count), y:  graph[n]))
        }
        for x in 1...dots.count-1 {
            addLine(from: dots[x-1], to: dots[x], color: graphColor)
            addCircle(at: dots[x], radiusInPixel: 1, color: graphColor)
        }
    }
    
    public func addLine(from : Dot, to: Dot, color: UIColor) {
        let shapeLayer = CAShapeLayer()
        self.layer.addSublayer(shapeLayer)
        let path = UIBezierPath()
        path.move(to:dotToCGPoint(dot: from))
        path.addLine(to:dotToCGPoint(dot: to))
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 1.0
    }
    
    public func dotToCGPoint(dot: Dot) -> CGPoint {
        return CGPoint(x:Double(width-2*padding)/(xAxisMax.x-xAxisMin.x)*(dot.x-xAxisMin.x)+padding,y:height-(padding+Double(height-2*padding)/(yAxisMax.y-yAxisMin.y)*(dot.y-yAxisMin.y)))
    }
    
    public func disco(of: Double) -> Double {
        let accuracy = (1-abs(Double.pi-of)/(Double.pi))
        return disco(accuracy: accuracy)
    }
    
    public func disco(accuracy: Double) -> Double
    {return round(log10(1/(1-accuracy))*1000)/1000.0}
    
    public func addCircle(at: Dot, radiusInPixel: Double, color: UIColor) {
        let shapeLayer = CAShapeLayer()
        self.layer.addSublayer(shapeLayer)
        let circlePath = UIBezierPath(arcCenter: dotToCGPoint(dot: at), radius: CGFloat(radiusInPixel), startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2), clockwise: true)
        shapeLayer.path = circlePath.cgPath
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = 1.0
    }
    
    public func addLabel(at: Dot, text: String, color: UIColor) {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.addSubview(label)
        label.center = dotToCGPoint(dot: at)
        label.textAlignment = .center
        label.text = text
        label.textColor = color
        }
}

