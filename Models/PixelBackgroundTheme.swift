//
//  PixelBackgroundTheme.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 15/05/2026.
//
import SwiftUI

struct PixelBackgroundTheme {
    let backgroundColor: Color
    let movingLayers: [MovingBackgroundLayer]
}

struct MovingBackgroundLayer: Identifiable {
    let id = UUID()
    let imageName: String?
    let frameNames: [String]?
    let speed: Double
    let opacity: Double
    let frameDuration: Double

    init(
        imageName: String,
        speed: Double,
        opacity: Double
    ) {
        self.imageName = imageName
        self.frameNames = nil
        self.speed = speed
        self.opacity = opacity
        self.frameDuration = 0.3
    }

    init(
        frameNames: [String],
        speed: Double,
        opacity: Double,
        frameDuration: Double
    ) {
        self.imageName = nil
        self.frameNames = frameNames
        self.speed = speed
        self.opacity = opacity
        self.frameDuration = frameDuration
    }
}
