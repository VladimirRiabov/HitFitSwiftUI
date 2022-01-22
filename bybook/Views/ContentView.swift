//
//  ContentView.swift
//  bybook
//
//  Created by Владимир Рябов on 22.01.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WelcomeView()   // was Text("Welcome")
            ForEach(0 ..< 4) { index in
                ExerciseView(index: index)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
