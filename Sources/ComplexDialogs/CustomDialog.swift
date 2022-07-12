import SwiftUI
import Combine

struct CustomDialog<Content: View, Cancel: View>: View {
    @Environment(\.colorScheme) var colorScheme
    @State var cancellables = Set<AnyCancellable>()
    @Binding var isPresented: Bool
    let bodyContent: Content
    let cancelContent: Cancel
    init(isPresented: Binding<Bool>, @ViewBuilder bodyContent: @escaping () -> Content, @ViewBuilder cancelContent: @escaping () -> Cancel) {
        self._isPresented = isPresented
        self.bodyContent = bodyContent()
        self.cancelContent = cancelContent()
    }
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            VStack {
                bodyContent
            }.background(colorScheme == .light ? Color.white: Color(UIColor.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
            cancelContent
                .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 0)
        }.padding(8)
        .transition(.move(edge: .bottom))
        .animation(Animation.easeInOut(duration: 0.5))
        .onAppear {
            NotificationCenter.onDismiss()
                .sink { _ in
                    isPresented = false
                }.store(in: &cancellables)
        }
//        .animation(Animation.easeInOut(duration: 0.5), value: !isPresented)
    }
}
