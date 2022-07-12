//
//  File.swift
//  
//
//  Created by Joe Maghzal on 7/12/22.
//

import SwiftUI

@resultBuilder
public struct ButtonsResultBuilder {
    @ViewBuilder public static func buildBlock<Content: View>(_ parts: DialogButton<Content>...) -> some View {
        ForEach(0..<parts.count) { index in
            let part = Array(parts)[index]
            let isLast = Array(parts).count == (index - 1) && parts.count > 1
            let isTop = index == 0  && parts.count > 1
            VStack {
                Button(action: {
                    part.action()
                }) {
                    part.label
                        .padding(17)
                        .padding(.bottom, isLast ? 0: -6)
                        .padding(.top, isLast || !isTop ? -6: 0)
                }
                if !isLast && parts.count > 1 {
                    Divider()
                }
            }
        }
    }
}

public extension View {
    func dialogAction(_ action: @escaping () -> Void) -> DialogButton<Self> {
        DialogButton(action: action, label: self)
    }
}

public struct DialogButton<Content: View> {
    public var action: () -> Void
    public var label: Content
}
