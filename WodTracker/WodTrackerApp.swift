//
//  WodTrackerApp.swift
//  WodTracker
//
//  Created by Konstantinos Kolioulis on 31/12/25.
//

import SwiftUI

@main
struct WodTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeTabView()
            }
        }
    }
}
