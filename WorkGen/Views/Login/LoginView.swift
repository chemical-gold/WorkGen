import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @EnvironmentObject var authContext: AuthContext
    
    @State var email = ""
    @State var password = ""
    
    func signIn() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            guard let user = authResult?.user else { return }
            authContext.user = user
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Image("exercise")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(minWidth: 200, maxWidth: 300, minHeight: 200, maxHeight: 300)
                
                VStack(alignment: .trailing) {
                    Heading("Login")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    RoundedTextField("Email", text: $email)
                    RoundedTextField("Password", text: $password, secure: true)
                    Button {
                        print("Forgot password")
                    } label: {
                        Text("Forgot password?")
                            .font(.custom("\(Constants.fontName)-Regular", size: 14))
                    }
                }
                
                Spacer()
                
                RoundedButton("Login", weight: "Bold") {
                    signIn()
                }
                            
                Spacer()
                
                HStack {
                    BodyText("Don't have an account?")
                    NavigationLink {
                        RegisterView()
                    } label: {
                        BodyText("Register")
                    }
                }
                
                Spacer()
            }
            .padding(32)
        }
    }
}

#Preview {
    LoginView()
}
