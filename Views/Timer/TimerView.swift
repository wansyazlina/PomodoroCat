//
//  TimerView.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 11/05/2026.
//

import SwiftUI

struct TimerView: View {
    @Bindable var homeViewModel: HomeViewModel
    @State private var timerViewModel = TimerViewModel()

    var body: some View {
        ZStack {
            PixelWeatherBackgroundView(
                theme: homeViewModel.backgroundTheme
            )

            VStack(spacing: 18) {
                ZStack {
                    Text(timerViewModel.formattedTime)
                        .font(.custom("Silkscreen-Bold", size: 72))
                        .foregroundStyle(.pink)
                        .offset(x: 4, y: 4)

                    Text(timerViewModel.formattedTime)
                        .font(.custom("Silkscreen-Bold", size: 72))
                        .foregroundStyle(Color("fontGrey"))
                }
         

                CatSpriteView(catState: timerViewModel.catState)

                Text(timerViewModel.timerTitle)
                    .font(.custom("Silkscreen-Bold", size: 22))
                    .foregroundStyle(.white)
            }
        }
        .frame(width: 480, height: 480)
    }
}

#Preview {
    TimerView(homeViewModel: HomeViewModel())
}
