//
//  HomeTabView.swift
//  WodTracker
//
//  Created by Konstantinos Kolioulis on 31/12/25.
//

import SwiftUI
import WodDesignSystem

struct HomeTabView: View {
    
    enum Tabs: Equatable, Hashable, Identifiable {
        case exercises
        case wod
        var id: Self { self }
    }
    
    @State private var selectedTab: Tabs = .exercises
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(
                "Exercices",
                systemImage: "figure.strengthtraining.traditional",
                value: .exercises
            ) {
                ExercisesScreen()
            }
            
            Tab(
                "WOD",
                systemImage: "figure.cross.training",
                value: .wod
            ) {
                Text("WOD")
            }
        }
        .tint(Color.wodThird)
    }
}

#Preview {
    HomeTabView()
}
