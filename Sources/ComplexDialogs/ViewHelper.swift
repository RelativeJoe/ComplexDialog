//
//  File.swift
//  
//
//  Created by Joe Maghzal on 7/12/22.
//

import SwiftUI

public extension View {
    @ViewBuilder func presentDialog(isPresented: Binding<Bool>, @ButtonsResultBuilder bodyContent: @escaping () -> some View, @ButtonsResultBuilder cancelContent: @escaping () -> some View) -> some View {
        ZStack {
            self
            if isPresented.wrappedValue {
                Color.black
                    .opacity(0.25)
                    .edgesIgnoringSafeArea(.all)
                    .animation(.easeInOut(duration: 0.3), value: isPresented.wrappedValue)
                CustomDialog(isPresented: isPresented, bodyContent: bodyContent, cancelContent: cancelContent)
            }
        }
    }
}
