import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    
    @EnvironmentObject var authContext: AuthContext
    @EnvironmentObject var errorHandler: ErrorHandler
    
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    func createUser() {
        if (password != confirmPassword){
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            guard let user = authResult?.user else { return }
            authContext.user = user
        }
    }
    
    var body: some View {
        VStack {
            Image("exercise")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(minWidth: 200, maxWidth: 300, minHeight: 200, maxHeight: 300)
            
            VStack(alignment: .trailing) {
                Heading("Register")
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                RoundedTextField("Email", text: $email)
                RoundedTextField("Password", text: $password, secure: true)
                RoundedTextField("Confirm Password", text: $confirmPassword, secure: true)
            }
            
            Spacer()
            
            RoundedButton("Register", weight: "Bold") {
                createUser()
            }
            
            Spacer()
        }
        .padding(32)
    }
}

#Preview {
    RegisterView()
}
