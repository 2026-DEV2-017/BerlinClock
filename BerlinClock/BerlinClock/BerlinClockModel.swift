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
        self.cancellable?.cancel()
        self.cancellable = nil
    }
    
    func start() {
        
    }
    
    func stop() {
        
    }
    
}
