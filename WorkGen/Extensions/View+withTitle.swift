import SwiftUI
import AlertToast

struct WithTitleViewModifier: ViewModifier {
    
    let title: String
    
    func body(content: Content) -> some View {
        NavigationStack {
            content
                .navigationTitle(title)
        }
    }
    
}

extension View {
    func withTitle(_ title: String) -> some View {
        modifier(WithTitleViewModifier(title: title))
    }
}
