public class Leibniz
{
    public var trial : Int
    public var result : [Double]
    
    public init(trial: Int) {
        self.trial = trial
        result = [0.0]
        for x in 1...trial {
            if x%2==0 {result.append(result[x-1]-(4/Double(2*x-1)))}
            else {result.append(result[x-1]+(4/Double(2*x-1)))}
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
