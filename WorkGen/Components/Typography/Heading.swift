import SwiftUI

struct Heading: View {
    
    var text: String
    
    init(_ text: String) {
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(.custom("\(Constants.fontName)-Black", size: 32))
    }
}

#Preview {
    Heading("Heading")
}
