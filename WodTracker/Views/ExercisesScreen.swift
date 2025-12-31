//
//  ExercisesScreen.swift
//  WodTracker
//
//  Created by Konstantinos Kolioulis on 31/12/25.
//

import SwiftUI
import WodDesignSystem

struct ExercisesScreen: View {
    var body: some View {
        VStack(spacing: 8) {
            WodEmptyStateView(
                systemImage: "figure.strengthtraining.traditional",
                title: "No exercises yet",
                description: "Add your first exercise to start tracking PRs",
                button: .init(
                    systemImage: "plus",
                    text: "Add",
                    action: {}
                )
            )
        }
        .appBackground()
    }
}

#Preview {
    ExercisesScreen()
}
