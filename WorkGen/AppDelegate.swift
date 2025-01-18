import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "\(Constants.fontName)-Bold", size: 32)!]
        
        FirebaseApp.configure()
        return true
    }
    
}
