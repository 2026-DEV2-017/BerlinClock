import Combine
import Foundation

struct TimerTimeProvider: TimeProviding {
    
    let updatePublisher: AnyPublisher<(hours: Int, minutes: Int, seconds: Int), Never> = {
        Timer.publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .map { _ in
                let time = Date.now
                let calendar = Calendar.current
                let components = calendar.dateComponents([.hour, .minute, .second], from: time)
                
                let hours = components.hour ?? 0
                let minutes = components.minute ?? 0
                let seconds = components.second ?? 0
                
                return (hours: hours, minutes: minutes, seconds: seconds)
            }
            .eraseToAnyPublisher()
    }()
    
    func start() {
    }
    
    func stop() {
    }
    
}
