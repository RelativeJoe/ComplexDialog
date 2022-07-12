//
//  File.swift
//  
//
//  Created by Joe Maghzal on 7/12/22.
//

import SwiftUI

@resultBuilder
public struct ButtonsResultBuilder {
    @ViewBuilder public static func buildBlock<Content: View>(_ parts: Content...) -> some View {
        ForEach(0..<parts.count) { index in
            let part = Array(parts)[index]
            let isLast = Array(parts).count == (index - 1)
            let isTop = index == 0
            VStack {
                part
                    .padding(17)
                    .padding(.bottom, isLast ? 0: -6)
                    .padding(.top, isLast || !isTop ? -6: 0)
                if !isLast {
                    Divider()
                }
            }
        }
    }
}
