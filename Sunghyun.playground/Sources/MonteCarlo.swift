import UIKit

public class MonteCarlo {
    public var result : [Double] = [0]
    public var trial : Int = 0
    public var circle : Int = 0

    public init(trial: Int, on: Graph) {
        self.trial = trial
        for _ in 1...trial
        {
            let dot = Dot()
            if dot.x*dot.x + dot.y*dot.y <= 1
            {
                self.circle += 1
                result.append(4.0*Double(circle)/Double(trial))
                on.addCircle(at: dot, radiusInPixel:0.5, color: UIColor.blue)
            }
            else {
                result.append(4.0*Double(circle)/Double(trial))
                on.addCircle(at: dot, radiusInPixel:0.5, color: UIColor.red)
            }
        }
    }
    
    public init(trial: Int) {
        self.trial = trial
        for n in 1...trial
        {
            let dot = Dot()
            if dot.x*dot.x + dot.y*dot.y <= 1
            {
                self.circle += 1
                result.append(4.0*Double(circle)/Double(n))
            }
            else {
                result.append(4.0*Double(circle)/Double(n))
            }
        }
    }
    
    public func getPi() -> Double {
        return result[result.count-1]
    }
    
    public func getDisco() -> Double {
        let disco = Disco()
        return disco.disco(of: self.getPi())
    }
    
    public func getAll() -> [Double] {
        return result
    }
}
