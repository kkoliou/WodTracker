//
//  View+.swift
//  WodTracker
//
//  Created by Konstantinos Kolioulis on 31/12/25.
//

import SwiftUI

struct AppBackground: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            content
        }
    }
}

extension View {
    func appBackground() -> some View {
        modifier(AppBackground())
    }
}
