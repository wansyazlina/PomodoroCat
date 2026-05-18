//
//  PixelBackgroundTheme.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 15/05/2026.
//
import Foundation

struct PixelBackgroundTheme {
    let baseImageName: String
    let movingLayers: [MovingBackgroundLayer]
}

struct MovingBackgroundLayer: Identifiable {
    let id = UUID()
    let imageName: String
    let speed: Double
    let opacity: Double
}
