//
//  RatingView.swift
//  bybook
//
//  Created by Владимир Рябов on 22.01.2022.
//

import SwiftUI

struct RatingView: View {
//    @Binding var rating: Int      // 1
    let maximumRating = 5  // 2
    let onColor = Color.red  // 3
    let offColor = Color.gray
    let exerciseIndex: Int
   @AppStorage("ratings") private var ratings = ""
   @State private var rating = 0
    
    init(exerciseIndex: Int) {
      self.exerciseIndex = exerciseIndex
      // 2
      let desiredLength = Exercise.exercises.count
      if ratings.count < desiredLength {
    // 3
        ratings = ratings.padding(
          toLength: desiredLength,
          withPad: "0",
          startingAt: 0)
    } }
    
    fileprivate func convertRating() {
        // 2 смещение на число exercise index относительно start index
        let index = ratings.index(ratings.startIndex, offsetBy: exerciseIndex)
        // 3
        let character = ratings[index]
        // 4
        rating = character.wholeNumberValue ?? 0
    }
    
    var body: some View {
        HStack {
            ForEach(0 ..< maximumRating + 1) { index in
                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(
                        index > rating ? offColor : onColor)
                    .onTapGesture {  // 5
                        updateRating(index: index)
                    }
                    .onAppear {
                        convertRating()
                    }
                    .onChange(of: ratings) { _ in
                     convertRating()
                   }
            }
        }
        .font(.largeTitle)
    }
    func updateRating(index: Int) {
      rating = index
      let index = ratings.index(
        ratings.startIndex,
        offsetBy: exerciseIndex)
      ratings.replaceSubrange(index...index, with: String(rating))
    }
    
}

struct RatingView_Previews: PreviewProvider {
  @AppStorage("ratings") static var ratings: String?
  static var previews: some View {
    ratings = nil
    return RatingView(exerciseIndex: 0)
      .previewLayout(.sizeThatFits)
  }
}
