//
//  File.swift
//  
//
//  Created by Joe Maghzal on 7/12/22.
//

import SwiftUI

public struct DialogButton<Content: View> {
    public var action: () -> Void
    public var label: Content
}
