import SwiftUI
import FirebaseAuth

class AuthContext: ObservableObject {
    
    @Published var user: User? = nil
    let firebaseAuth = Auth.auth()
    var listener: AuthStateDidChangeListenerHandle? = nil
    
    init(user: User? = nil) {
        self.user = user

        listener = firebaseAuth.addStateDidChangeListener { auth, user in
            guard let user = user else { return }
            self.user = user
            auth.removeStateDidChangeListener(self.listener!)
        }
    }
    
    func signOut() {
        do {
            try firebaseAuth.signOut()
            user = nil
        } catch {
            print("ERROR")
        }
    }
}
