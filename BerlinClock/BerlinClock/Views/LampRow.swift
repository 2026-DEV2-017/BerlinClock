import SwiftUI

struct LampRow: View {
    
    let pattern: String
    
    var body: some View {
        HStack {
            ForEach(Array(pattern.enumerated()), id: \.offset) { _, character in
                Rectangle()
                    .fill(fillColor(for: character))
                    .strokeBorder(lineWidth: 2)
            }
        }
    }
}

// MARK: - Private

private extension LampRow {
    
    func fillColor(for character: Character) -> Color {
        if character == "R" {
            Color.red
        } else if character == "Y" {
            Color.yellow
        } else {
            Color.clear
        }
    }
    
}

#Preview {
    LampRow(pattern: "YYYY")
}
