import SwiftUI

struct ContentView: View {
    
    @State var tabSelection = 1
    @EnvironmentObject var authContext: AuthContext
    
    var body: some View {
        if authContext.user != nil {
            TabView(selection: $tabSelection) {
                HomeView(tabSelection: $tabSelection)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(1)
                
                ScheduleView()
                    .tabItem {
                        Label("Schedule", systemImage: "calendar")
                    }
                    .tag(2)
                
                ExerciseView()
                    .tabItem {
                        Label("Exercises", systemImage: "figure.run")
                    }
                    .tag(3)
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                    .tag(4)
            }
        } else {
            LoginView()
        }
    }
}

#Preview {
    ContentView()
}
