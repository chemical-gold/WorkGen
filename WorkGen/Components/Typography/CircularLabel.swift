import SwiftUI

struct CircularLabel: View {
    
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Circle()
            .fill(.white)
            .stroke(.gray, lineWidth: 1)
            .frame(width: 32, height: 32)
            .overlay {
                BodyText(text)
            }
    }
}

#Preview {
    CircularLabel("#1")
}
