//
//  ExercisesScreen.swift
//  ExercisesFeature
//
//  Created by Konstantinos Kolioulis on 1/1/26.
//

import SwiftUI
import WodDesignSystem

public struct ExercisesScreen: View {
    
    @State private var viewModel = ExercisesViewModel()
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 8) {
            Group {
                if viewModel.selectedExercises.isEmpty {
                    WodEmptyStateView(
                        systemImage: "figure.strengthtraining.traditional",
                        title: "No exercises yet",
                        description: "Add your first exercise to start tracking PRs",
                        button: .init(
                            systemImage: "plus",
                            text: "Add Exercise",
                            action: {
                                viewModel.addExerciseButtonTapped()
                            }
                        )
                    )
                } else {
                    List {
                        ForEach(viewModel.selectedExercises, id: \.selectedExercise.id) {
                            Text($0.exerciseDetails?.name ?? "")
                        }
                    }
                }
            }
            .sheet(isPresented: $viewModel.isAddExercisePresented) {
                NavigationStack {
                    SearchExerciseScreen()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ExercisesScreen()
    }
}
