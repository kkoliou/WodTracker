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
    @ObservationIgnored @Dependency(\.defaultDatabase) var database
    var searchText: String = ""
    var presentExerciseAlreadyAddedAlert: Bool = false
    
    func searchTextTyped(_ text: String) async {
        await withErrorReporting {
            _ = try await $exercises.load(
                Exercise
                    .where { $0.name.contains(text) }
            )
        }
    }
    
    func deleteExercises(at offsets: IndexSet) async {
        withErrorReporting {
            try database.write { db in
                try Exercise.find(offsets.map { exercises[$0].id })
                    .delete()
                    .execute(db)
            }
        }
    }
    
    func addExercise(_ exercise: String) async {
        withErrorReporting {
            let trimmed = exercise.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !trimmed.isEmpty else { return }
            try database.write { db in
                let exists = try Exercise
                    .where { $0.name == trimmed }
                    .fetchCount(db) > 0
                
                if exists {
                    presentExerciseAlreadyAddedAlert = true
                    return
                }
                
                try Exercise.insert {
                    Exercise.Draft(name: trimmed)
                }
                .execute(db)
            }
        }
    }
}
