import Testing
@testable import BerlinClock

struct DigitalTimeToBerlinClockConverterTests {

    @Suite("Single minutes row")
    struct SingleMinutesRowTests {
        
        @Test(
            "Given an initialised converter, when converting single minutes, then the correct lamps are returned",
            arguments: [
                (minutes: 0, expectedResult: "0000"),
                (minutes: 1, expectedResult: "Y000"),
                (minutes: 2, expectedResult: "YY00"),
                (minutes: 3, expectedResult: "YYY0"),
                (minutes: 4, expectedResult: "YYYY"),
            ]
        )
        func singleMinutes(minutes: Int, expectedResult: String) async throws {
            // Given
            let converter = DigitalTimeToBerlinClockConverter()
            
            // When
            let result = converter.singleMinutesRow(minutes: minutes)
            
            // Then
            #expect(result == expectedResult)
        }
        
    }

}
