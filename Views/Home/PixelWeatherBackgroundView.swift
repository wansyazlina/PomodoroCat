//
//  PixelWeatherBackgroundView.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 15/05/2026.
//
import SwiftUI

struct PixelWeatherBackgroundView: View {
    let theme: PixelBackgroundTheme

    var body: some View {
        ZStack {
            Image(theme.baseImageName)
                .resizable()
                .interpolation(.none)
                .scaledToFill()
                .ignoresSafeArea()

            ForEach(theme.movingLayers) { layer in
                MovingPixelLayerView(layer: layer)
            }
        }
        .clipped()
    }
}

struct MovingPixelLayerView: View {
    let layer: MovingBackgroundLayer

    @State private var isMoving = false

    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                layerImage(size: geo.size)
                layerImage(size: geo.size)
            }
            .offset(x: isMoving ? -geo.size.width : 0)
            .animation(
                .linear(duration: layer.speed)
                .repeatForever(autoreverses: false),
                value: isMoving
            )
            .opacity(layer.opacity)
            .onAppear {
                isMoving = true
            }
        }
        .ignoresSafeArea()
    }

    private func layerImage(size: CGSize) -> some View {
        Image(layer.imageName)
            .resizable()
            .interpolation(.none)
            .scaledToFill()
            .frame(width: size.width, height: size.height)
            .clipped()
    }
}
