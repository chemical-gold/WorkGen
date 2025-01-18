import SwiftUI

struct SettingsView: View {
    
    @State var fontFamily = Constants.fontName
    @State var name = Constants.displayName ?? ""
    
    @AppStorage("fontName") var fontName: String?
    @AppStorage("displayName") var displayName: String?
    
    @EnvironmentObject var authContext: AuthContext
    
    let avaliableFonts = [
        "Jost",
        "RedditSans",
        "Rubik",
        "Lato",
        "Roboto",
        "Inter"
    ]
    
    var body: some View {
        Form {
            Section(header: Text("Theme"), footer: Text("Note: This may require an app restart.")) {
                Picker("Font Family", selection: $fontFamily) {
                    ForEach(avaliableFonts, id: \.self) { font in
                        BodyText(font)
                    }
                }
            }
            
            Section(header: Text("Information"), footer: Text("Note: This may require an app restart.")) {
                TextField("Display Name", text: $name)
            }
            
            Section {
                Button(role: .destructive) {
                    authContext.signOut()
                } label: {
                    Text("Sign Out")
                }

            }
        }
        .withTitle("Settings")
        .onChange(of: fontFamily) { _, newValue in
            Constants.fontName = newValue
            fontName = newValue
        }
        .onChange(of: name) { _, newValue in
            Constants.displayName = newValue
            displayName = newValue
        }
    }
}

#Preview {
    SettingsView()
}
