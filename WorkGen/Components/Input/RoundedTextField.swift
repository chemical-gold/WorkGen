import SwiftUI

struct RoundedTextField: View {
    
    var placeholder: String
    @Binding var text: String
    var secure: Bool
    
    init(_ placeholder: String, text: Binding<String>, secure: Bool = false) {
        self.placeholder = placeholder
        self._text = text
        self.secure = secure
    }
    
    var body: some View {
        if (!secure) {
            TextField(placeholder, text: $text)
                .font(.custom("\(Constants.fontName)-Regular", size: 16))
                .textFieldStyle(.roundedBorder)
        } else {
            SecureField(placeholder, text: $text)
                .font(.custom("\(Constants.fontName)-Regular", size: 16))
                .textFieldStyle(.roundedBorder)
                .textContentType(.password)
        }
    }
}

#Preview {
    RoundedTextField("Email", text: .constant(""))
}
