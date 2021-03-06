//
//  HistoryStoreDevData.swift
//  bybook
//
//  Created by Владимир Рябов on 23.01.2022.
//

import Foundation

extension HistoryStore {
  func createDevData() {
    // Development data
    exerciseDays = [
      ExerciseDay(
        date: Date().addingTimeInterval(-86400),
        exercises: [
          Exercise.exercises[0].exerciseName,
          Exercise.exercises[1].exerciseName,
          Exercise.exercises[2].exerciseName
        ]),
      ExerciseDay(
        date: Date().addingTimeInterval(-86400 * 2),
        exercises: [
          Exercise.exercises[1].exerciseName,
          Exercise.exercises[0].exerciseName
        ])
    ]
  }

  convenience init(debugData: Bool) {
    self.init()
    createDevData()
  }
}
