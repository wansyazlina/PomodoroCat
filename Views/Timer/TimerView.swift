//
//  TimerView.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 11/05/2026.
//

import SwiftUI

struct TimerView: View {
    @Bindable var homeViewModel: HomeViewModel

    var body: some View {
        ZStack {
            PixelWeatherBackgroundView(
                theme: homeViewModel.backgroundTheme
            )

            VStack {
                CatSpriteView(
                    animationTag: homeViewModel.catAnimationTag
                )

                Text("Timer View")
                    .font(.title)

                Button("Start Break") {
                    homeViewModel.updateCatState(.resting)
                }

                Button("Complete") {
                    homeViewModel.updateCatState(.completed)
                }
            }
        }
        .frame(width: 480, height: 480)
    }
}

#Preview {
    TimerView(homeViewModel: HomeViewModel())
}
