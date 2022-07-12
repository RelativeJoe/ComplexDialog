//
//  File.swift
//  
//
//  Created by Joe Maghzal on 7/12/22.
//

import Foundation
import Combine

extension Notification.Name {
    static let dialogDismissed = Notification.Name("DialogDismissed")
}

extension NotificationCenter {
    static func dismissDialog() {
        NotificationCenter.default.post(name: .dialogDismissed, object: nil)
    }
    static func onDismiss() -> AnyPublisher<Notification, Never> {
        NotificationCenter.default.publisher(for: .dialogDismissed).eraseToAnyPublisher()
    }
}
