//
//  HistoryView.swift
//  bybook
//
//  Created by Владимир Рябов on 22.01.2022.
//

import SwiftUI

struct HistoryView: View {
    
    let history = HistoryStore()
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Button(action: {}) {
                Image(systemName: "xmark.circle")
                    .font(.title)
                    .padding(.trailing)
            }
            VStack {
                Text("History")
                    .font(.title)
                    .padding()
                
                Form {
                    ForEach(history.exerciseDays) { day in
                        Section {
                            ForEach(day.exercises, id: \.self) { exercise in
                                Text(exercise)
                            }
                        } header: {
                            Text(day.date, format: .dateTime.day().month().year())
                        }
                    }
                }

            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
