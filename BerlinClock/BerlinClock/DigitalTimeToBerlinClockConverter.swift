import Foundation

nonisolated struct DigitalTimeToBerlinClockConverter {
    
    func singleMinutesRow(minutes: Int) -> String {
        if minutes == 0 {
            return "0000"
        } else if minutes == 1 {
            return "Y000"
        } else if minutes == 2 {
            return "YY00"
        } else {
            return "YYY0"
        }
    }
    
}
