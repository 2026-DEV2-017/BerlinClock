import SwiftUI

struct BerlinClockView: View {
    
    @State private var model = BerlinClockModel(timeProvider: TimerTimeProvider())
    
    var body: some View {
        VStack {
            Circle()
                .fill(model.seconds == "Y" ? Color.yellow : .clear)
                .strokeBorder(lineWidth: 2)
            
            HStack {
                ForEach(Array(model.fiveHours.enumerated()), id: \.offset) { _, character in
                    Rectangle()
                        .fill(character == "R" ? Color.red : .clear)
                        .strokeBorder(lineWidth: 2)
                }
            }
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
