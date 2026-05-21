//
//  TimerViewModel.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 15/05/2026.
//
import Foundation

@Observable
class TimerViewModel {
    var timerMode: TimerMode = .focus
    var remainingSeconds: Int = 25 * 60

    var timerTitle: String {
        switch timerMode {
        case .focus:
            return "FOCUS"
        case .shortBreak:
            return "BREAK"
        case .longBreak:
            return "LONG BREAK"
        case .completed:
            return "DONE"
        }
    }

    var formattedTime: String {
        let minutes = remainingSeconds / 60
        let seconds = remainingSeconds % 60

        return String(format: "%02d:%02d", minutes, seconds)
    }

    var catState: CatState {
        switch timerMode {
        case .focus:
            return .focused
        case .shortBreak, .longBreak:
            return .resting
        case .completed:
            return .completed
        }
    }

    func startFocusTimer() {
        timerMode = .focus
        remainingSeconds = 25 * 60
    }

    func startShortBreak() {
        timerMode = .shortBreak
        remainingSeconds = 5 * 60
    }

    func startLongBreak() {
        timerMode = .longBreak
        remainingSeconds = 15 * 60
    }

    func completeTimer() {
        timerMode = .completed
        remainingSeconds = 0
    }
}
