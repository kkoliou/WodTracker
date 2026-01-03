//
//  SearchExerciseViewModel.swift
//  ExercisesFeature
//
//  Created by Konstantinos Kolioulis on 3/1/26.
//

import SwiftUI

@Observable @MainActor
class SearchExerciseViewModel {
    
    let exercises: [String]
    var searchText: String = ""
    var isAddExerciseButtonVisible: Bool = false
    var results = [String]()
    
    init() {
        exercises = ["Power clean", "Squat clean", "Hang snatch"]
        results = exercises
    }
    
    @concurrent
    func searchTextTyped(_ text: String) async {
        guard !Task.isCancelled else { return }

        let lowercasedText = text.lowercased()
        var results = [String]()
        var alreadyExists = false

        if lowercasedText.isEmpty {
            results = exercises
        } else {
            for exercise in exercises {
                guard !Task.isCancelled else { return }
                
                let lowercasedExercise = exercise.lowercased()

                if lowercasedExercise.contains(lowercasedText) {
                    results.append(exercise)
                }

                if lowercasedExercise == lowercasedText {
                    alreadyExists = true
                }
            }
        }

        guard !Task.isCancelled else { return }

        await MainActor.run {
            self.results = results
            self.isAddExerciseButtonVisible = !lowercasedText.isEmpty && !alreadyExists
        }
    }

    
}
