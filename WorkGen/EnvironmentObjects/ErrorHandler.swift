import Foundation

struct ErrorAlert {
    let id = UUID()
    var message: String
}

class ErrorHandler: ObservableObject {
    
    @Published var isPresenting = false
    @Published var message = ""
    
    func handle(_ message: String) {
        print("Error: \(message)")
        self.message = message
        isPresenting = true
    }
    
}
