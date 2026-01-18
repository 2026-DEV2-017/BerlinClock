import Foundation

nonisolated struct DigitalTimeToBerlinClockConverter {
    
    func singleMinutesRow(minutes: Int) -> String {
        let litAmount = minutes % 5
        return lampString(litAmount: litAmount, litIndicator: "Y", totalLamps: 4)
    }
    
    func fiveMinutesRow(minutes: Int) -> String {
        let litAmount = minutes / 5
        let unlitAmount = 11 - litAmount
        let unlitString = String(repeating: "0", count: unlitAmount)
        
        var litString = ""
        for num in 0..<litAmount {
            if (num + 1) % 3 == 0 {
                litString += "R"
            } else {
                litString += "Y"
            }
        }
        
        return litString + unlitString
    }
    
    func singleHoursRow(hours: Int) -> String {
        let litAmount = hours % 5
        return lampString(litAmount: litAmount, litIndicator: "R", totalLamps: 4)
    }
    
    func fiveHoursRow(hours: Int) -> String {
        let litAmount = hours / 5
        return lampString(litAmount: litAmount, litIndicator: "R", totalLamps: 4)
    }
    
    func secondsLamp(seconds: Int) -> String {
        let isEven = seconds.isMultiple(of: 2)
        return isEven ? "Y" : "0"
    }
    
    private func lampString(litAmount: Int, litIndicator: String, totalLamps: Int) -> String {
        let unlitAmount = totalLamps - litAmount
        
        let litString = String(repeating: litIndicator, count: litAmount)
        let unlitString = String(repeating: "0", count: unlitAmount)
        
        return litString + unlitString
    }
    
}
