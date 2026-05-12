//
//  AppRootView.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 11/05/2026.
//

import SwiftUI

struct AppRootView: View {
    @State private var currentScreen: AppScreen = .home

    var body: some View {
        switch currentScreen {
        case .home:
            HomeView {
                currentScreen = .timer
            }

        case .timer:
            TimerView()
        }
    }
}

#Preview {
    AppRootView()
}
