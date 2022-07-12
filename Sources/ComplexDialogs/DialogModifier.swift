//
//  File.swift
//  
//
//  Created by Joe Maghzal on 7/12/22.
//

import SwiftUI

public struct DialogModifier: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    public func body(content: Content) -> some View {
        return content.background(colorScheme == .dark ? Color(UIColor.systemGray6): Color.white)
    }
}
