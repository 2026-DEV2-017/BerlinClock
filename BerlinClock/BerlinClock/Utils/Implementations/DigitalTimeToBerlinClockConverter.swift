import Foundation

nonisolated struct DigitalTimeToBerlinClockConverter {
    
    /// Calculates the lamp string for the single minutes row
    /// - Parameter minutes: the minutes to convert
    /// - Returns: a string representing he single minute lamps
    func singleMinutesRow(minutes: Int) -> String {
        let litAmount = minutes % 5
        
        return lampString(
            litAmount: litAmount,
            totalLamps: 4
        ) { _ in
            "Y"
        }
    }
    
    /// Calculates the lamp string for the five minutes row
    /// - Parameter minutes: the minutes to convert
    /// - Returns: a string representing the five minute lamps
    func fiveMinutesRow(minutes: Int) -> String {
        let litAmount = minutes / 5
        
        return lampString(
            litAmount: litAmount,
            totalLamps: 11
        ) { litLampIndex in
            (litLampIndex + 1) % 3 == 0 ? "R" : "Y"
        }
    }
    
    /// Calculates the lamp string for the single hours row
    /// - Parameter hours: the hours to convert
    /// - Returns: a string representing the single hour lamps
    func singleHoursRow(hours: Int) -> String {
        let litAmount = hours % 5
        
        return lampString(
            litAmount: litAmount,
            totalLamps: 4
        ) { _ in
            "R"
        }
    }
    
    /// Calculates the lamp string for the five hours row
    /// - Parameter hours: the hours to convert
    /// - Returns: a string representing the five hour lamps
    func fiveHoursRow(hours: Int) -> String {
        let litAmount = hours / 5
        
        return lampString(
            litAmount: litAmount,
            totalLamps: 4
        ) { _ in
            "R"
        }
    }
    
    /// Calculates the lamp string for seconds
    /// - Parameter seconds: the seconds to convert
    /// - Returns: a string representing the seconds lamp state
    func secondsLamp(seconds: Int) -> String {
        let isEven = seconds.isMultiple(of: 2)
        return isEven ? "Y" : "0"
    }
    
    /// Calculates the lamp string based on the provided parameters
    /// - Parameters:
    ///   - litAmount: the amount of lit lamps
    ///   - totalLamps: the total amount of lamps
    ///   - litIndicator: closure to return the lit lamp indicator based on the current 0-based index of the lit lamps
    /// - Returns: a string representing the overall state of the lamps
    private func lampString(
        litAmount: Int,
        totalLamps: Int,
        litIndicator: ((Int) -> String)
    ) -> String {
        let unlitAmount = totalLamps - litAmount
        
        let unlitString = String(repeating: "0", count: unlitAmount)
        
        var litString: String = ""
        
        for index in 0..<litAmount {
            litString += litIndicator(index)
        }
        
        return litString + unlitString
    }
    
}
