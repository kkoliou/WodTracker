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
    
    var body: some View {
        ScrollView {
            VStack {
                if viewModel.isAddExerciseButtonVisible {
                    AddExerciseListButton(name: $viewModel.searchText, action: {})
                        .padding()
                }
                ForEach(viewModel.searchResults, id: \.self) {
                    ExerciseListItem(text: $0)
                        .padding(.horizontal)
                }
            }
        }
        .searchable(
            text: $viewModel.searchText,
            placement: .automatic,
            prompt: "e.g., Squat clean"
        )
        .onChange(of: viewModel.searchText) { _, newValue in
            viewModel.handleAddExerciseButtonVisibility(searchText: newValue)
        }
    }
}

#Preview {
    NavigationStack {
        SearchExerciseScreen()
    }
}
