import SwiftUI

struct BodyText: View {
    
    var text: String
    var weight: String
    
    init(_ text: String, weight: String = "Regular") {
        self.text = text
        self.weight = weight
    }
    
    var body: some View {
        Text(text)
            .font(.custom("\(Constants.fontName)-\(weight)", size: 16))
    }
}

#Preview {
    BodyText("Hello")
}
