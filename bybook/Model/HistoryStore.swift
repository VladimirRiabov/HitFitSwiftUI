//
//  HistoryStore.swift
//  bybook
//
//  Created by Владимир Рябов on 23.01.2022.
//

import Foundation

struct ExerciseDay: Identifiable {
  let id = UUID()
  let date: Date
  var exercises: [String] = []
}
struct HistoryStore {
  var exerciseDays: [ExerciseDay] = []
    
    init() {
      #if DEBUG
      createDevData()
      #endif
    }
}



