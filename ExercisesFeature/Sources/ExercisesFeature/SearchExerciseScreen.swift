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
            ForEach(viewModel.exercises, id: \.id) {
                Text($0.name)
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
    }
}

#Preview {
    NavigationStack {
        SearchExerciseScreen()
    }
}
