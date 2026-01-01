//
//  ExercisesScreen.swift
//  ExercisesFeature
//
//  Created by Konstantinos Kolioulis on 1/1/26.
//

import SwiftUI
import WodDesignSystem

public struct ExercisesScreen: View {
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 8) {
            WodEmptyStateView(
                systemImage: "figure.strengthtraining.traditional",
                title: "No exercises yet",
                description: "Add your first exercise to start tracking PRs",
                button: .init(
                    systemImage: "plus",
                    text: "Add Exercise",
                    action: {}
                )
            )
        }
    }
}

#Preview {
    ExercisesScreen()
}
