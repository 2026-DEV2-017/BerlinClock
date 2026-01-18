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
        let unlitAmount = 4 - litAmount
        
        let litString = String(repeating: "R", count: litAmount)
        let unlitString = String(repeating: "0", count: unlitAmount)
        
        return litString + unlitString
    }
    
    func fiveHoursRow(hours: Int) -> String {
        let litAmount = hours / 5
        let unlitAmount = 4 - litAmount
        
        let litString = String(repeating: "R", count: litAmount)
        let unlitString = String(repeating: "0", count: unlitAmount)
        
        return litString + unlitString
    }
    
    func secondsLamp(seconds: Int) -> String {
        let remainder = seconds % 2
        let isEven = remainder == 0
        
        if isEven {
            return "Y"
        } else {
            return "0"
        }
    }
    
}
