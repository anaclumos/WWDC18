import UIKit
import PlaygroundSupport

public class Dot {
    public let x : Double
    public let y : Double
    
    public init()
    {
        let arc4randoMax : Double = 0x100000000
        let upper = 1.0
        let lower = -1.0
        self.x = Double(Float32((Double(arc4random()) / arc4randoMax) * (upper - lower) + lower))
        self.y = Double(Float32((Double(arc4random()) / arc4randoMax) * (upper - lower) + lower))
    }
    
    public init(x: Double, y: Double)
    {
        self.x = x
        self.y = y
    }
    
    public func string() {
        print("Dot location : (\(self.x),\(self.y))")
    }
}
