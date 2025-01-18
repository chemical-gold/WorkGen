import Foundation

struct Constants {
    
    static var fontName = UserDefaults.standard.string(forKey: "fontName") ?? "Jost"
    static var displayName = UserDefaults.standard.string(forKey: "displayName")
    
}
