//
//  AppRootView.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 11/05/2026.
//

import SwiftUI

struct AppRootView: View {
    @State private var currentScreen: AppScreen = .home //this is a live variable that will constantly refresh when the variable changes.
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

    //currentPage is a computed property not a function. Computed Property mean it already stores/returns a value
    //this listens to live variable, currentScreen. If .home then shows HomeView. if .timer, shows the TimerView
    
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
