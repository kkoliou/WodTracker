//
//  SearchExerciseScreen.swift
//  ExercisesFeature
//
//  Created by Konstantinos Kolioulis on 3/1/26.
//

import SwiftUI
import WodDesignSystem

struct SearchExerciseScreen: View {

    @State private var viewModel = SearchExerciseViewModel()
    @State private var searchTask: Task<Void, Never>?
    
    var body: some View {
        List {
            ForEach(viewModel.exercises, id: \.id) { exercise in
                Button(exercise.name) {
                    Task {
                        await viewModel.select(exercise)
                    }
                }
            }
            .onDelete { indexSet in
                Task {
                    await viewModel.deleteExercises(at: indexSet)
                }
            }
            if !viewModel.searchText.isEmpty {
                Button("Add \"\(viewModel.searchText)\"") {
                    Task {
                        await viewModel.addExercise(viewModel.searchText)
                    }
                }
            }
        }
        .searchable(
            text: $viewModel.searchText,
            placement: .automatic,
            prompt: "e.g., Squat clean"
        )
        .onChange(of: viewModel.searchText) { _, newValue in
            searchTask?.cancel()
            searchTask = Task {
                await viewModel.searchTextTyped(newValue)
            }
        }
        .navigationTitle("Search exercice")
        .presentationDragIndicator(.visible)
        .alert(
            "",
            isPresented: $viewModel.presentExerciseAlreadyAddedAlert,
            actions: {},
            message: {
                Text("This exercise is already in your list.")
            }
        )
    }
}

#Preview {
    NavigationStack {
        SearchExerciseScreen()
    }
}
