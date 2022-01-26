//
//  RaisedButton.swift
//  bybook
//
//  Created by Владимир Рябов on 26.01.2022.
//

import SwiftUI

enum EmbossedButtonShape {
 case round, capsule
}

struct EmbossedButton: View {
    let buttonText: String
      let action: () -> Void
      var body: some View {
        Button(action: {
          action()
        }, label: {
          Text(buttonText)
            .raisedButtonTextStyle()
        })
        .buttonStyle(RaisedButtonStyle())
      }
    }

struct EmbossedButtonStyle: ButtonStyle {
    var buttonShape = EmbossedButtonShape.capsule
    func makeBody(configuration: Configuration) -> some View {
      let shadow = Color("drop-shadow")
      let highlight = Color("drop-highlight")
      return configuration.label
        .padding(10)
        .background(
            shape()
            .foregroundColor(Color("background"))
            .shadow(color: shadow, radius: 1, x: 2, y: 2)
            .shadow(color: highlight, radius: 1, x: -2, y: -2)
            .offset(x: -1, y: -1)
    )
        
    }
    func shape() -> some View {
      switch buttonShape {
      case .round:
        Circle()
          .stroke(Color("background"), lineWidth: 2)
      case .capsule:
        Capsule()
          .stroke(Color("background"), lineWidth: 2)
      }
    }

}
//
//extension Text {
//  func raisedButtonTextStyle() -> some View {
//self
//    .font(.body)
//    .fontWeight(.bold)
//  }
//}

struct EmbossedButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Button(
            action: {},
            label: {
            Text("History")
              .fontWeight(.bold)
            })
          .buttonStyle(EmbossedButtonStyle())
          .padding(40)
      .previewLayout(.sizeThatFits)
            Button(
                action: {},
                label: {
                    Text("History")
                        .fontWeight(.bold)
                })
                .preferredColorScheme(.dark)
                .buttonStyle(EmbossedButtonStyle())
                .padding(40)
                .previewLayout(.sizeThatFits)
        }
    }
}
