import SwiftUI

struct RoundedButton: View {
    
    var label: String
    var weight: String
    var action: () -> Void
    
    init(_ label: String, weight: String = "Regular", action: @escaping () -> Void) {
        self.label = label
        self.weight = weight
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 12)
                .overlay {
                    BodyText(label, weight: weight)
                        .foregroundStyle(.white)
                }
                .frame(height: 48)
        }
    }
}

#Preview {
    RoundedButton("Login") {
        print("Pressed")
    }
}
