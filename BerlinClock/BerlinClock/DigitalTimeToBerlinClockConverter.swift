import Foundation

nonisolated struct DigitalTimeToBerlinClockConverter {
    
    func singleMinutesRow(minutes: Int) -> String {
        if minutes == 0 {
            return "0000"
        } else {
            return "Y000"
        }
    }
    
}
