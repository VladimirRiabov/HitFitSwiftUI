//
//  RatingView.swift
//  bybook
//
//  Created by Владимир Рябов on 22.01.2022.
//

import SwiftUI

struct RatingView: View {
    @Binding var rating: Int  // 1
    let maximumRating = 5  // 2
    let onColor = Color.red  // 3
    let offColor = Color.gray
    var body: some View {
        HStack {
            ForEach(0 ..< maximumRating + 1) { index in
                Image(systemName: "waveform.path.ecg")
                    .foregroundColor(
                        index > rating ? offColor : onColor)
                    .onTapGesture {  // 5
                        rating = index
                    }
            }
        }
        .font(.largeTitle)
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RatingView(rating: .constant(3))
                .previewLayout(/*@START_MENU_TOKEN@*/.sizeThatFits/*@END_MENU_TOKEN@*/)
            RatingView(rating: .constant(3))
                .preferredColorScheme(.dark)
                .environment(\.sizeCategory, .accessibilityLarge)
                .previewLayout(/*@START_MENU_TOKEN@*/.sizeThatFits/*@END_MENU_TOKEN@*/)
        }
    }
}
