//
//  bybookApp.swift
//  bybook
//
//  Created by Владимир Рябов on 22.01.2022.
//

import SwiftUI

@main
struct bybookApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                  print(FileManager.default.urls(
                    for: .documentDirectory,
                    in: .userDomainMask))
                }
        }
    }
}
    
