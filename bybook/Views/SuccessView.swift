//
//  SuccessView.swift
//  bybook
//
//  Created by Владимир Рябов on 23.01.2022.
//

import SwiftUI

struct SuccessView: View {
    let text2 = """
  Good Job completing all four exercises!
  Remember tomorrow's another day.
  So eat well and get some rest.
"""
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "hand.raised.fill")
                    .resizedToFill(width: 75, height: 75)
                    .foregroundColor(.purple)
                Text("High Five!")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.largeTitle)
                    
                Text(text2)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                
            }
            VStack {
                Spacer()
                Button("History") { }
                .padding(.bottom)
            }
        }
    }
}

struct SuccessView_Previews: PreviewProvider {
    static var previews: some View {
        SuccessView()
    }
}
