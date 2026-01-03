//
//  ExercisesViewModel.swift
//  ExercisesFeature
//
//  Created by Konstantinos Kolioulis on 1/1/26.
//

import Foundation

@Observable
class ExercisesViewModel {
    
    var isAddExercisePresented = false
    
    func addExerciseButtonTapped() {
        isAddExercisePresented = true
    }
    
}
