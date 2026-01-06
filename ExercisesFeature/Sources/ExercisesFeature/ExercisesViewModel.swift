//
//  ExercisesViewModel.swift
//  ExercisesFeature
//
//  Created by Konstantinos Kolioulis on 1/1/26.
//

import Foundation
import WodDB
import SQLiteData

@Observable @MainActor
class ExercisesViewModel {
    
    @Selection struct Row {
        let selectedExercise: SelectedExercise
        let exerciseDetails: Exercise?
    }
    
    @ObservationIgnored @FetchAll(
        SelectedExercise
            .group(by: \.id)
            .leftJoin(Exercise.all) {
                $0.exerciseID == $1.id
            }
            .select {
                Row.Columns(selectedExercise: $0, exerciseDetails: $1)
            }
    ) var selectedExercises
    var isAddExercisePresented = false
    
    func addExerciseButtonTapped() {
        isAddExercisePresented = true
    }
    
}
