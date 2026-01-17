import Testing
@testable import BerlinClock

struct DigitalTimeToBerlinClockConverterTests {

    @Suite("Single minutes row")
    struct SingleMinutesRowTests {
        
        @Test("Given an initialised converter, when converting single minutes, then the correct lamps are returned")
        func singleMinutes() async throws {
            // Given
            let converter = DigitalTimeToBerlinClockConverter()
            
            // When
            let result = converter.singleMinutesRow(minutes: 0)
            
            // Then
            #expect(result == "0000")
        }
        
    }

}
