import Foundation

public class Disco
{
    public init() {
    }
    
    public func disco(of: Double) -> Double {
        let accuracy = (1-abs(Double.pi-of)/(Double.pi))
        return disco(accuracy: accuracy)
    }
    
    public func disco(accuracy: Double) -> Double
    {
        return round(log10(1/(1-accuracy))*1000)/1000.0
    }
}
