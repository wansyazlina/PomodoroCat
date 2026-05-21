//
//  HomeViewModel.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 11/05/2026.
//

import Foundation
import SwiftUI

@Observable
class HomeViewModel {
    var catName: String = "moiran" //setting moiran as default for now
    var catState: CatState = .idle // CatState is set to idle when user is at HomeView
    
    // Set sunny for testing new background
    var weatherCondition: WeatherCondition = .sunny
    
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
                backgroundColor: Color(red: 176/255, green: 211/255, blue: 230/255),
                movingLayers: [
                    MovingBackgroundLayer(
                        imageName: "clouds_back",
                        speed: 55,
                        opacity: 0.6
                    ),

                    MovingBackgroundLayer(
                        frameNames: [
                            "sparkles_1",
                            "sparkles_2",
                            "sparkles_3",
                            "sparkles_4"
                        ],
                        speed: 35,
                        opacity: 0.8,
                        frameDuration: 0.25
                    ),

                    MovingBackgroundLayer(
                        imageName: "clouds_front",
                        speed: 22,
                        opacity: 1.0
                    )
                ]
            )
        case .cloudy:
            return PixelBackgroundTheme(
                backgroundColor: Color(red: 180/255, green: 190/255, blue: 200/255),
                movingLayers: []
            )
            
        case .rainy:
            return PixelBackgroundTheme(
                backgroundColor: Color(red: 120/255, green: 145/255, blue: 165/255),
                movingLayers: []
            )
            
        case .stormy:
            return PixelBackgroundTheme(
                backgroundColor: Color(red: 70/255, green: 80/255, blue: 100/255),
                movingLayers: []
            )
            
        case .night:
            return PixelBackgroundTheme(
                backgroundColor: Color(red: 25/255, green: 30/255, blue: 55/255),
                movingLayers: []
            )
        }
    }
}
