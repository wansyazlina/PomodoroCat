//
//  AppRootView.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 11/05/2026.
//

import SwiftUI

struct AppRootView: View {
    @State private var currentScreen: AppScreen = .home
    @State private var homeViewModel = HomeViewModel()

    var body: some View {
        ZStack(alignment: .topLeading) {
            currentPage
            
            // Invisible draggable strip
            DraggableWindowArea()
                .frame(height: 36)
                .frame(maxWidth: .infinity)
                .background(Color.clear)

            WindowControls()
                .padding(8)
        }
        .frame(width: 480, height: 480)
        .background(WindowAccessor())
        
    }

    @ViewBuilder
    private var currentPage: some View {
        switch currentScreen {
        case .home:
            HomeView(
                viewModel: homeViewModel,
                onStart: {
                    homeViewModel.updateCatState(.focused)
                    currentScreen = .timer
                }
            )

        case .timer:
            TimerView(homeViewModel: homeViewModel)
        }
    }
}

#Preview("Full App") {
    AppRootView()
}
