import SwiftUI

@main
struct BerlinClockApp: App {
    
    @State private var model = BerlinClockModel(timeProvider: TimerTimeProvider())
    
    var body: some Scene {
        WindowGroup {
            BerlinClockView(model: model)
        }
    }
    
}
