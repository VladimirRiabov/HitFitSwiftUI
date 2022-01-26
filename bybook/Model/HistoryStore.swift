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
class HistoryStore: ObservableObject {
    
    enum FileError: Error {
        case loadFailure
        case saveFailure
        case urlFailure
    }
    
    @Published var exerciseDays: [ExerciseDay] = []
    
    init(withChecking: Bool) throws {
#if DEBUG
        //        createDevData()жд
        print("Initializing HistoryStore")
        do {
            try load()
        } catch {
            throw error
        }
        
#endif
    }
    
    init() {
        
    }
    
    
    func load() throws {
      guard let dataURL = getURL() else {
        throw FileError.urlFailure
      }
      guard let data = try? Data(contentsOf: dataURL) else {
        return
      }
      let plistData = try PropertyListSerialization.propertyList(
        from: data,
        options: [],
        format: nil)
      let convertedPlistData = plistData as? [[Any]] ?? []
      exerciseDays = convertedPlistData.map {
        ExerciseDay(
          date: $0[1] as? Date ?? Date(),
          exercises: $0[2] as? [String] ?? [])
      }
    }
    
    func addDoneExercise(_ exerciseName: String) {
        let today = Date()
        if let firstDate = exerciseDays.first?.date,
           today.isSameDay(as: firstDate) { // 1
            print("Adding \(exerciseName)")
            exerciseDays[0].exercises.append(exerciseName)
            
        } else {
            exerciseDays.insert( // 2
                ExerciseDay(date: today, exercises: [exerciseName]),
                at: 0)
            
        }
        do {
            try save()
        } catch {
            fatalError(error.localizedDescription)
        }
        
    }
    
    func getURL() -> URL? {
        // 1
        guard let documentsURL = FileManager.default.urls(
            for: .documentDirectory, in: .userDomainMask).first else {
                // 2
                return nil
            }
        // 3
        return documentsURL.appendingPathComponent("history.plist")
    }
    
    func save() throws {
        guard let dataURL = getURL() else {
            throw FileError.urlFailure
        }
        let plistData = exerciseDays.map {
            [$0.id.uuidString, $0.date, $0.exercises]
        }
        do { // 1
            let data = try PropertyListSerialization.data(
                fromPropertyList: plistData,
                format: .binary,
                options: .zero)
            // 2
            try data.write(to: dataURL, options: .atomic)
        } catch {
            // 3
            throw FileError.saveFailure
        }
    }
    
    
}



