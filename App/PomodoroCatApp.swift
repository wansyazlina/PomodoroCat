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
            HomeView()
                .frame(width: 410, height: 410)
        }
        .windowResizability(.contentSize)
    }
}
