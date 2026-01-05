//
//  WodTrackerApp.swift
//  WodTracker
//
//  Created by Konstantinos Kolioulis on 31/12/25.
//

import SwiftUI
import WodDB
import Dependencies
import SQLiteData

@main
struct WodTrackerApp: App {
    
    init() {
        prepareDependencies {
            try! $0.bootstrapDatabase()
            try! $0.defaultDatabase.seed()
        }
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeTabView()
            }
        }
    }
}
