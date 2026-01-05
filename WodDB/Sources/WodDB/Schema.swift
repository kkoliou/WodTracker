//
//  Schema.swift
//  WodDB
//
//  Created by Konstantinos Kolioulis on 5/1/26.
//

import SQLiteData
import Foundation

@Table public struct Exercise: Identifiable, Sendable {
    public let id: UUID
    public var name: String
}

func appDatabase() throws -> any DatabaseWriter {
    let database = try SQLiteData.defaultDatabase()
    var migrator = DatabaseMigrator()
    #if DEBUG
    migrator.eraseDatabaseOnSchemaChange = true
    #endif
    migrator.registerMigration("Create 'exercises' table") { db in
        try #sql("""
          CREATE TABLE "exercises" (
            "id" TEXT PRIMARY KEY NOT NULL ON CONFLICT REPLACE DEFAULT (uuid()),
            "name" TEXT NOT NULL DEFAULT ''
          ) STRICT
          """)
        .execute(db)
    }
    try migrator.migrate(database)
    return database
}

extension DependencyValues {
    mutating public func bootstrapDatabase() throws {
        defaultDatabase = try appDatabase()
    }
}

extension DatabaseWriter {
    public func seed() throws {
        let flagKey = "db_initialized"
        let isFirstLaunch = !UserDefaults.standard.bool(forKey: flagKey)
        guard isFirstLaunch else { return }
        try write { db in
            try db.seed {
                Exercise.Draft(name: "Back squat")
                Exercise.Draft(name: "Front squat")
                Exercise.Draft(name: "Overhead squat")
                Exercise.Draft(name: "Pause squat")
                Exercise.Draft(name: "Box squat")
                Exercise.Draft(name: "Deadlift")
                Exercise.Draft(name: "Romanian deadlift")
                Exercise.Draft(name: "Sumo deadlift")
                Exercise.Draft(name: "Sumo deadlift high pull")
                Exercise.Draft(name: "Deficit deadlift")
                Exercise.Draft(name: "Bench press")
                Exercise.Draft(name: "Incline bench press")
                Exercise.Draft(name: "Close-grip bench press")
                Exercise.Draft(name: "Strict press")
                Exercise.Draft(name: "Push press")
                Exercise.Draft(name: "Push jerk")
                Exercise.Draft(name: "Split jerk")
                Exercise.Draft(name: "Behind-the-neck jerk")
                Exercise.Draft(name: "Power clean")
                Exercise.Draft(name: "Squat clean")
                Exercise.Draft(name: "Hang clean")
                Exercise.Draft(name: "Clean pull")
                Exercise.Draft(name: "Clean and jerk")
                Exercise.Draft(name: "Power snatch")
                Exercise.Draft(name: "Squat snatch")
                Exercise.Draft(name: "Hang snatch")
                Exercise.Draft(name: "Snatch pull")
                Exercise.Draft(name: "Snatch balance")
                Exercise.Draft(name: "Thruster")
                Exercise.Draft(name: "Wall ball")
                Exercise.Draft(name: "Pull-up")
                Exercise.Draft(name: "Chest-to-bar pull-up")
                Exercise.Draft(name: "Strict pull-up")
                Exercise.Draft(name: "Ring row")
                Exercise.Draft(name: "Muscle-up")
                Exercise.Draft(name: "Ring muscle-up")
                Exercise.Draft(name: "Bar muscle-up")
                Exercise.Draft(name: "Toes-to-bar")
                Exercise.Draft(name: "Hanging knee raise")
                Exercise.Draft(name: "L-sit")
                Exercise.Draft(name: "V-up")
                Exercise.Draft(name: "Sit-up")
                Exercise.Draft(name: "GHD sit-up")
                Exercise.Draft(name: "Burpee")
                Exercise.Draft(name: "Burpee box jump over")
                Exercise.Draft(name: "Box jump")
                Exercise.Draft(name: "Box jump over")
                Exercise.Draft(name: "Broad jump")
                Exercise.Draft(name: "Double under")
                Exercise.Draft(name: "Single under")
                Exercise.Draft(name: "Rowing")
                Exercise.Draft(name: "Bike erg")
                Exercise.Draft(name: "Assault bike")
                Exercise.Draft(name: "Ski erg")
                Exercise.Draft(name: "Running")
                Exercise.Draft(name: "Farmer's carry")
                Exercise.Draft(name: "Sandbag carry")
                Exercise.Draft(name: "Yoke carry")
                Exercise.Draft(name: "Kettlebell swing")
                Exercise.Draft(name: "Russian kettlebell swing")
                Exercise.Draft(name: "American kettlebell swing")
                Exercise.Draft(name: "Kettlebell clean")
                Exercise.Draft(name: "Kettlebell snatch")
                Exercise.Draft(name: "Kettlebell goblet squat")
                Exercise.Draft(name: "Dumbbell snatch")
                Exercise.Draft(name: "Dumbbell clean")
                Exercise.Draft(name: "Dumbbell clean and jerk")
                Exercise.Draft(name: "Dumbbell bench press")
                Exercise.Draft(name: "Dumbbell lunges")
                Exercise.Draft(name: "Walking lunges")
                Exercise.Draft(name: "Overhead lunges")
                Exercise.Draft(name: "Front rack lunges")
                Exercise.Draft(name: "Step-ups")
                Exercise.Draft(name: "Pistol squat")
                Exercise.Draft(name: "Air squat")
                Exercise.Draft(name: "Handstand hold")
                Exercise.Draft(name: "Handstand push-up")
                Exercise.Draft(name: "Strict handstand push-up")
                Exercise.Draft(name: "Handstand walk")
                Exercise.Draft(name: "Wall walk")
                Exercise.Draft(name: "Ring dip")
                Exercise.Draft(name: "Bench dip")
                Exercise.Draft(name: "Push-up")
                Exercise.Draft(name: "Deficit push-up")
                Exercise.Draft(name: "Clapping push-up")
                Exercise.Draft(name: "Plank")
                Exercise.Draft(name: "Side plank")
                Exercise.Draft(name: "Russian twist")
                Exercise.Draft(name: "Back extension")
                Exercise.Draft(name: "GHD back extension")
                Exercise.Draft(name: "Good morning")
                Exercise.Draft(name: "Hip thrust")
                Exercise.Draft(name: "Glute bridge")
            }
        }
        UserDefaults.standard.set(true, forKey: flagKey)
    }
}
