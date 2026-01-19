import SwiftUI

struct BerlinClockView: View {
    
    @State private var model = BerlinClockModel(timeProvider: TimerTimeProvider())
    
    var body: some View {
        VStack {
            Circle()
                .fill(model.seconds == "Y" ? Color.yellow : .clear)
                .strokeBorder(lineWidth: 2)
            
            LampRow(pattern: model.fiveHours)
            LampRow(pattern: model.singleHours)
            LampRow(pattern: model.fiveMinutes)
            LampRow(pattern: model.singleMinutes)
        }
        .padding()
        .onAppear {
            model.start()
        }
        .onDisappear {
            model.stop()
        }
    }
}

#Preview {
    BerlinClockView()
}
