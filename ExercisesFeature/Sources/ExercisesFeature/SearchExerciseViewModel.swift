//
//  SearchExerciseViewModel.swift
//  ExercisesFeature
//
//  Created by Konstantinos Kolioulis on 3/1/26.
//

import SwiftUI
import WodDB
import SQLiteData

@Observable @MainActor
class SearchExerciseViewModel {
    
    @ObservationIgnored @FetchAll var exercises: [Exercise]
    var searchText: String = ""
    
    func searchTextTyped(_ text: String) async {
        await withErrorReporting {
            _ = try await $exercises.load(
                Exercise
                    .where { $0.name.contains(text) }
            )
        }
    }
}
