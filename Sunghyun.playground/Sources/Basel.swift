public class Basel
{
    public var trial : Int
    public var resultsquared : [Double]
    
    public init(trial: Int) {
        self.trial = trial
        resultsquared = [0.0]
        for x in 1...trial {
            resultsquared.append(resultsquared[resultsquared.count-1] + 6.0/Double(x*x))
        }
    }
    
    public func getPi() -> Double {
        return resultsquared[resultsquared.count-1].squareRoot()
    }
    
    public func getAll() -> [Double] {
        var result : [Double] = []
        for member in resultsquared
        {
            result.append(member.squareRoot())
        }
        return result
    }
    
    public func getDisco() -> Double {
        let disco = Disco()
        return disco.disco(of: self.getPi())
    }
}
