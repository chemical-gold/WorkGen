import SwiftUI

struct SignInWithGoogleButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 12)
                .stroke(.gray, lineWidth: 1)
                .fill(.background)
                .overlay {
                    HStack {
                        Image("g-logo")
                            .resizable()
                            .frame(width: 22, height: 22)
                                                
                        BodyText("Sign in with Google")
                            .foregroundColor(.black)
                    }
                }
                .frame(height: 48)
        }
    }
}

#Preview {
    SignInWithGoogleButton() {
        print("Sign in with Google")
    }
}
