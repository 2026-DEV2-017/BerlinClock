import Combine
import SwiftUI

@MainActor
@Observable
final class BerlinClockModel {
    
    private(set) var seconds: String = "0"
    private(set) var fiveHours: String = "0000"
    private(set) var singleHours: String = "0000"
    private(set) var fiveMinutes: String = "00000000000"
    private(set) var singleMinutes: String = "0000"
    
    private var cancellable: AnyCancellable?
    
    private let converter = DigitalTimeToBerlinClockConverter()
    private let timeProvider: TimeProviding
    
    init(timeProvider: some TimeProviding) {
        self.timeProvider = timeProvider
    }
    
    @MainActor
    deinit {
        cancellable?.cancel()
        cancellable = nil
    }
    
    func start() {
        cancellable = timeProvider.updatePublisher
            .sink { [unowned self] time in
                self.seconds = self.converter.secondsLamp(seconds: time.seconds)
                self.fiveHours = self.converter.fiveHoursRow(hours: time.hours)
                self.singleHours = self.converter.singleHoursRow(hours: time.hours)
                self.fiveMinutes = self.converter.fiveMinutesRow(minutes: time.minutes)
                self.singleMinutes = self.converter.singleMinutesRow(minutes: time.minutes)
            }
    }
    
    func stop() {
        cancellable?.cancel()
        cancellable = nil
    }
    
}
