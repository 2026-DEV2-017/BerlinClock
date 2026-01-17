import Foundation

nonisolated struct DigitalTimeToBerlinClockConverter {
    
    func singleMinutesRow(minutes: Int) -> String {
        let litAmount = minutes % 5
        let unlitAmount = 4 - litAmount
        
        let litString = String(repeating: "Y", count: litAmount)
        let unlitString = String(repeating: "0", count: unlitAmount)
        
        return litString + unlitString
    }
    
    func fiveMinutesRow(minutes: Int) -> String {
        let litAmount = minutes / 5
        
        var output = ""
        for num in 0..<11 {
            if num < litAmount {
                output += "Y"
            } else {
                output += "0"
            }
        }
        
        return output
    }
    
}
