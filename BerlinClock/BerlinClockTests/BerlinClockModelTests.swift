import Testing
import Combine
@testable import BerlinClock

@MainActor
struct BerlinClockModelTests {

    @Test(
        "Given that the model is started, when the time updates, then the seconds property is correct",
        arguments: [
            ((hours: 0, minutes: 0, seconds: 0), expectedResult: "Y"),
            ((hours: 0, minutes: 0, seconds: 1), expectedResult: "0"),
            ((hours: 23, minutes: 59, seconds: 59), expectedResult: "0"),
            ((hours: 2, minutes: 38, seconds: 26), expectedResult: "Y"),
        ]
    )
    func seconds(time: (hours: Int, minutes: Int, seconds: Int), expectedResult: String) {
        // Given
        let timeProvider = MockTimeProvider()
        let model = BerlinClockModel(timeProvider: timeProvider)
        model.start()
        
        // When
        timeProvider.updateTime(hours: time.hours, minutes: time.minutes, seconds: time.seconds)
        
        // Then
        #expect(model.seconds == expectedResult)
    }
    
    @Test(
        "Given that the model is started, when the time updates, then the five hours property is correct",
        arguments: [
            ((hours: 0, minutes: 0, seconds: 0), expectedResult: "0000"),
            ((hours: 23, minutes: 59, seconds: 59), expectedResult: "RRRR"),
            ((hours: 2, minutes: 4, seconds: 0), expectedResult: "0000"),
            ((hours: 8, minutes: 23, seconds: 0), expectedResult: "R000"),
            ((hours: 16, minutes: 35, seconds: 0), expectedResult: "RRR0"),
        ]
    )
    func fiveHours(time: (hours: Int, minutes: Int, seconds: Int), expectedResult: String) {
        // Given
        let timeProvider = MockTimeProvider()
        let model = BerlinClockModel(timeProvider: timeProvider)
        model.start()
        
        // When
        timeProvider.updateTime(hours: time.hours, minutes: time.minutes, seconds: time.seconds)
        
        // Then
        #expect(model.fiveHours == expectedResult)
    }
    
    @Test(
        "Given that the model is started, when the time updates, then the single hours property is correct",
        arguments: [
            ((hours: 0, minutes: 0, seconds: 0), expectedResult: "0000"),
            ((hours: 23, minutes: 59, seconds: 59), expectedResult: "RRR0"),
            ((hours: 2, minutes: 4, seconds: 0), expectedResult: "RR00"),
            ((hours: 8, minutes: 23, seconds: 0), expectedResult: "RRR0"),
            ((hours: 14, minutes: 35, seconds: 0), expectedResult: "RRRR"),
        ]
    )
    func singleHours(time: (hours: Int, minutes: Int, seconds: Int), expectedResult: String) {
        // Given
        let timeProvider = MockTimeProvider()
        let model = BerlinClockModel(timeProvider: timeProvider)
        model.start()
        
        // When
        timeProvider.updateTime(hours: time.hours, minutes: time.minutes, seconds: time.seconds)
        
        // Then
        #expect(model.singleHours == expectedResult)
    }
    
    @Test(
        "Given that the model is started, when the time updates, then the five minutes property is correct",
        arguments: [
            ((hours: 0, minutes: 0, seconds: 0), expectedResult: "00000000000"),
            ((hours: 23, minutes: 59, seconds: 59), expectedResult: "YYRYYRYYRYY"),
            ((hours: 12, minutes: 4, seconds: 0), expectedResult: "00000000000"),
            ((hours: 12, minutes: 23, seconds: 0), expectedResult: "YYRY0000000"),
            ((hours: 12, minutes: 35, seconds: 0), expectedResult: "YYRYYRY0000"),
        ]
    )
    func fiveMinutes(time: (hours: Int, minutes: Int, seconds: Int), expectedResult: String) {
        // Given
        let timeProvider = MockTimeProvider()
        let model = BerlinClockModel(timeProvider: timeProvider)
        model.start()
        
        // When
        timeProvider.updateTime(hours: time.hours, minutes: time.minutes, seconds: time.seconds)
        
        // Then
        #expect(model.fiveMinutes == expectedResult)
    }

}

struct MockTimeProvider: TimeProviding {
    
    var updatePublisher: AnyPublisher<(hours: Int, minutes: Int, seconds: Int), Never> {
        updateSubject.eraseToAnyPublisher()
    }
    
    private let updateSubject = PassthroughSubject<(hours: Int, minutes: Int, seconds: Int), Never>()
    
    func start() {
        
    }
    
    func stop() {
        
    }
    
    func updateTime(hours: Int, minutes: Int, seconds: Int) {
        updateSubject.send((hours: hours, minutes: minutes, seconds: seconds))
    }
    
}
