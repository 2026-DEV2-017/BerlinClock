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
                (minutes: 5, expectedResult: "0000"),
                (minutes: 59, expectedResult: "YYYY"),
                (minutes: 32, expectedResult: "YY00"),
                (minutes: 34, expectedResult: "YYYY"),
                (minutes: 35, expectedResult: "0000"),
            ]
        )
        func singleMinutesRow(minutes: Int, expectedResult: String) {
            // Given
            let converter = DigitalTimeToBerlinClockConverter()
            
            // When
            let result = converter.singleMinutesRow(minutes: minutes)
            
            // Then
            #expect(result == expectedResult)
        }
        
        @Test(
            "Given an initialised converter, when calculating the 5 minutes row, then the correct lamp output is returned",
            arguments: [
                (minutes: 0, expectedResult: "00000000000"),
                (minutes: 5, expectedResult: "Y0000000000")
            ]
        )
        func fiveMinutesRow(minutes: Int, expectedResult: String) {
            // Given
            let converter = DigitalTimeToBerlinClockConverter()
            
            // When
            let result = converter.fiveMinutesRow(minutes: minutes)
            
            // Then
            #expect(result == expectedResult)
        }
        
    }

}
