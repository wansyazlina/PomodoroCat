# PomodoroCat

## About

A native macOS pixel-art Pomodoro app with an animated cat, timer states, sounds, and weather-based backgrounds.

## Reason for Build

To help people with ADHD/neurodivergent focus on laptop work and improve concentration. All the while having a cute pet which monitors your work.

## Project Structure

The app is organized into a few simple areas:

- `App/`: Contains the main app entry point.
- `Views/`: Contains the SwiftUI screens and reusable UI pieces.
- `Views/Home/`: Contains the home screen, cat display, slide-to-start control, and home-specific visuals.
- `Views/Timer/`: Contains the timer screen.
- `ViewModels/`: Contains app state and screen logic for the home and timer flows.
- `Models/`: Contains small data types such as timer modes, cat states, weather conditions, and background themes.
- `SpriteKit/`: Contains the animated cat scene and Aseprite animation loader.
- `Resources/`: Contains bundled files such as fonts and Aseprite JSON animation data.
- `Assets/`: Contains image assets, spritesheets, colors, and other visual resources.
- `PomodoroCatTests/`: Contains unit tests.
- `PomodoroCatUITests/`: Contains UI tests.

## How It Works

The app uses SwiftUI for the macOS interface and SpriteKit for the animated cat. `HomeViewModel` controls the home screen state, including the current cat state and weather background. `TimerViewModel` controls timer-related state such as focus, break, and completed modes.

The cat animation is handled by `CatScene`, which asks `AsepriteAnimationLoader` to load frame animations from the bundled Aseprite JSON file and spritesheet assets.

Weather backgrounds are described by `PixelBackgroundTheme`, then rendered by `PixelWeatherBackgroundView` using layered pixel-art images.
