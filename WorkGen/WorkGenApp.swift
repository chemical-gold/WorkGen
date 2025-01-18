import SwiftUI

@main
struct WorkGenApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.light)
                .environmentObject(AuthContext())
                .withErrorHandlingAndDatabase()
        }
    }
}
