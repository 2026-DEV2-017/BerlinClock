import Combine
import SwiftUI

@MainActor
@Observable
final class BerlinClockModel {
    
    private(set) var seconds: String = ""
    private(set) var fiveHours: String = ""
    private(set) var singleHours: String = ""
    private(set) var fiveMinutes: String = ""
    private(set) var singleMinutes: String = ""
    
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
            }
    }
    
    func stop() {
        cancellable?.cancel()
        cancellable = nil
    }
    
}
