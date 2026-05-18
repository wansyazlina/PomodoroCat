//
//  PomodoroCatApp.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 11/05/2026.
//

import SwiftUI

@main
struct PomodoroCatApp: App {
    var body: some Scene {
        WindowGroup {
            AppRootView()
                .ignoresSafeArea()
            
         
        }
        .windowStyle(.hiddenTitleBar)
        .windowResizability(.contentSize)
    }
}
