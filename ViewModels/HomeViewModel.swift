//
//  HomeViewModel.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 11/05/2026.
//

import Foundation

@Observable
class HomeViewModel {
    var catName: String = "moiran"

    // Landing page default
    var catState: CatState = .idle

    // Placeholder for now.
    // Later, this can come from a real weather service.
    var weatherCondition: WeatherCondition = .cloudy

    func startIntro() {
        catState = .focused
    }

    func updateCatState(_ newState: CatState) {
        catState = newState
    }

    var catAnimationTag: String {
        switch catState {
        case .idle:
            return "tailwiggle"
        case .focused:
            return "tailwiggle"

        case .resting:
            return "tailwiggle"

        case .completed:
            return "tailwiggle"
       
        }
    }

    var backgroundTheme: PixelBackgroundTheme {
        switch weatherCondition {
        case .sunny:
            return PixelBackgroundTheme(
                baseImageName: "bg_sunny",
                movingLayers: [
                    MovingBackgroundLayer(imageName: "clouds_far", speed: 45, opacity: 0.5),
                    MovingBackgroundLayer(imageName: "clouds_near", speed: 25, opacity: 0.9)
                ]
            )

        case .cloudy:
            return PixelBackgroundTheme(
                baseImageName: "bg_cloudy",
                movingLayers: [
                    MovingBackgroundLayer(imageName: "clouds_far_gray", speed: 55, opacity: 0.7),
                    MovingBackgroundLayer(imageName: "clouds_near_gray", speed: 35, opacity: 1.0)
                ]
            )

        case .rainy:
            return PixelBackgroundTheme(
                baseImageName: "bg_rainy",
                movingLayers: [
                    MovingBackgroundLayer(imageName: "rain_layer", speed: 8, opacity: 0.8),
                    MovingBackgroundLayer(imageName: "clouds_rain", speed: 35, opacity: 0.9)
                ]
            )

        case .stormy:
            return PixelBackgroundTheme(
                baseImageName: "bg_stormy",
                movingLayers: [
                    MovingBackgroundLayer(imageName: "storm_clouds", speed: 25, opacity: 1.0)
                ]
            )

        case .night:
            return PixelBackgroundTheme(
                baseImageName: "bg_night",
                movingLayers: [
                    MovingBackgroundLayer(imageName: "stars_layer", speed: 80, opacity: 0.8),
                    MovingBackgroundLayer(imageName: "night_clouds", speed: 50, opacity: 0.6)
                ]
            )
        }
    }
}
