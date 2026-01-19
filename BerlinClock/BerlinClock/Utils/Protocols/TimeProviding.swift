import Foundation
import Combine

/// Protocol for providing time
protocol TimeProviding {
    /// Update publisher providing hours, minutes, seconds
    var updatePublisher: AnyPublisher<(hours: Int, minutes: Int, seconds: Int), Never> { get }
}
