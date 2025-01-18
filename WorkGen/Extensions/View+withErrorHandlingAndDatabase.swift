import SwiftUI
import AlertToast

struct ErrorHandlerViewModifier: ViewModifier {
    
    @StateObject var errorHandler = ErrorHandler()
    
    func body(content: Content) -> some View {
        content
            .environmentObject(errorHandler)
            .environmentObject(DatabaseManager(errorHandler: errorHandler))
            .toast(isPresenting: $errorHandler.isPresenting) {
                AlertToast(displayMode: .hud, type: .error(.red), title: errorHandler.message)
            }
    }
    
}

extension View {
    func withErrorHandlingAndDatabase() -> some View {
        modifier(ErrorHandlerViewModifier())
    }
}
