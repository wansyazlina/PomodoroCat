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
            theme.backgroundColor
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
    @State private var currentFrameIndex = 0

    private var currentImageName: String {
        if let frameNames = layer.frameNames, !frameNames.isEmpty {
            return frameNames[currentFrameIndex]
        }

        return layer.imageName ?? ""
    }

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
                startFrameAnimation()
            }
        }
        .ignoresSafeArea()
    }

    private func layerImage(size: CGSize) -> some View {
        Image(currentImageName)
            .resizable()
            .interpolation(.none)
            .scaledToFill()
            .frame(width: size.width, height: size.height)
            .clipped()
    }

    private func startFrameAnimation() {
        guard let frameNames = layer.frameNames, frameNames.count > 1 else {
            return
        }

        Timer.scheduledTimer(withTimeInterval: layer.frameDuration, repeats: true) { _ in
            currentFrameIndex = (currentFrameIndex + 1) % frameNames.count
        }
    }
}
