//
//  RaisedButton.swift
//  bybook
//
//  Created by Владимир Рябов on 26.01.2022.
//

import SwiftUI

struct RaisedButton: View {
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

struct RaisedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
      configuration.label
        .frame(maxWidth: .infinity)
        .padding([.top, .bottom], 12)
        .background(
    Capsule()
        .foregroundColor(Color("background"))
       .shadow(color: Color("drop-shadow"), radius: 4, x: 6, y: 6)
       .shadow(color: Color("drop-highlight"), radius: 4, x: -6, y: -6)
        )
    }
    
}

extension Text {
  func raisedButtonTextStyle() -> some View {
self
    .font(.body)
    .fontWeight(.bold)
  }
}

struct RaisedButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                RaisedButton(
                 buttonText: "Get Started",
                 action: {
                     print("Hello World")
                  })
                    .padding(20)
                }
            .buttonStyle(RaisedButtonStyle())
                .background(Color("background"))
            .previewLayout(.sizeThatFits)
            ZStack {
                RaisedButton(
                 buttonText: "Get Started",
                 action: {
                     print("Hello World")
                  })
                    .padding(20)
            }
            .preferredColorScheme(.dark)
            .buttonStyle(RaisedButtonStyle())
            .background(Color("background"))
            .previewLayout(.sizeThatFits)
        }
    }
}
