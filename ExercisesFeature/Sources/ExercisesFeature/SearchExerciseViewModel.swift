//
//  SearchExerciseViewModel.swift
//  ExercisesFeature
//
//  Created by Konstantinos Kolioulis on 3/1/26.
//

import SwiftUI

@Observable
class SearchExerciseViewModel {
    let exercises = ["Power clean", "Squat clean", "Hang snatch"]
    var searchText: String = ""
    var isAddExerciseButtonVisible: Bool = false
    
    var searchResults: [String] {
        if searchText.isEmpty {
            return exercises
        } else {
            return exercises.filter {
                $0.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    func handleAddExerciseButtonVisibility(searchText: String) {
        isAddExerciseButtonVisible = !searchText.isEmpty
    }
}
