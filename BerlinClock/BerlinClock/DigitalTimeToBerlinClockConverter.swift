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
        return ""
    }
    
}
