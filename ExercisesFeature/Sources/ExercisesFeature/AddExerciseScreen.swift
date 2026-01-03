//
//  AddExerciseScreen.swift
//  ExercisesFeature
//
//  Created by Konstantinos Kolioulis on 1/1/26.
//

import SwiftUI
import WodDesignSystem

struct AddExerciseScreen: View {
    
    @State private var viewModel = AddExerciseViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                WodTextField(
                    text: $viewModel.exerciseTextField,
                    placeholder: "e.g., Squat clean"
                )
            }
        }
    }
}

#Preview {
    AddExerciseScreen()
}
