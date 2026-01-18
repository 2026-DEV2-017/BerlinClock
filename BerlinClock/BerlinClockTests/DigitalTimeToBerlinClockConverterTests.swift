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
        
    }
    
    @Suite("Five minutes row")
    struct FiveMinutesRowTests {
        
        @Test(
            "Given an initialised converter, when calculating the 5 minutes row, then the correct lamp output is returned",
            arguments: [
                (minutes: 0, expectedResult: "00000000000"),
                (minutes: 5, expectedResult: "Y0000000000"),
                (minutes: 59, expectedResult: "YYRYYRYYRYY"),
                (minutes: 4, expectedResult: "00000000000"),
                (minutes: 23, expectedResult: "YYRY0000000"),
                (minutes: 35, expectedResult: "YYRYYRY0000"),
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
    
    @Suite("Single hours row")
    struct SingleHoursRowTests {
        
        @Test(
            "Given an initialised converter, when calculating the single hours row, then the correct lamp output is returned",
            arguments: [
                (hours: 0, expectedResult: "0000"),
                (hours: 23, expectedResult: "RRR0"),
                (hours: 1, expectedResult: "R000"),
                (hours: 2, expectedResult: "RR00"),
                (hours: 8, expectedResult: "RRR0"),
                (hours: 14, expectedResult: "RRRR"),
            ]
        )
        func singleHoursRow(hours: Int, expectedResult: String) {
            // Given
            let converter = DigitalTimeToBerlinClockConverter()
            
            // When
            let result = converter.singleHoursRow(hours: hours)
            
            // Then
            #expect(result == expectedResult)
        }
        
    }
    
    @Suite("Five hours row")
    struct FiveHoursRowTests {
        
        @Test(
            "Given an initialised converter, when calculating the five hours row, then the correct lamp output is returned",
            arguments: [
                (hours: 0, expectedResult: "0000"),
                (hours: 23, expectedResult: "RRRR"),
                (hours: 2, expectedResult: "0000"),
                (hours: 8, expectedResult: "R000"),
                (hours: 16, expectedResult: "RRR0"),
                (hours: 5, expectedResult: "R000"),
            ]
        )
        func fiveHoursRow(hours: Int, expectedResult: String) {
            // Given
            let converter = DigitalTimeToBerlinClockConverter()
            
            // When
            let result = converter.fiveHoursRow(hours: hours)
            
            // Then
            #expect(result == expectedResult)
        }
        
    }

}
