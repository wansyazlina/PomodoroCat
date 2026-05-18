//
//  HomeView.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 11/05/2026.
//

import SwiftUI

struct HomeView: View {
    @Bindable var viewModel: HomeViewModel

    var onStart: () -> Void = { }

    var body: some View {
        ZStack {
            Color.white// change to backgroundLayer later

            VStack(spacing: 10) {
                Text("MY POMODORO CAT")
                    .font(.custom("VT323-Regular", size: 40, relativeTo: .title))
                    .foregroundStyle(.black)

                Text(viewModel.catName)
                    .font(.custom("Silkscreen", size: 20, relativeTo: .title))
                    .foregroundStyle(.black)

                catIntroView

                VStack(spacing: 3) {
                    Text("slide to start")
                        .font(.custom("ArchitypeStedelijkW00", size: 18, relativeTo: .caption))
                        .foregroundStyle(.black)

                    SlideToStartView {
                        onStart()
                    }
                }
            }
            .padding()
        }
        .frame(width: 480, height: 480)
    }

    private var backgroundLayer: some View {
        PixelWeatherBackgroundView(theme: viewModel.backgroundTheme)
    }

    private var catIntroView: some View {
        CatSpriteView(animationTag: viewModel.catAnimationTag)
    }
    
}
    
#Preview("HomeView only") {
    HomeView(viewModel: HomeViewModel())
}
