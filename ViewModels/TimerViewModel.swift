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
    }

    func startShortBreak() {
        timerMode = .shortBreak
    }

    func startLongBreak() {
        timerMode = .longBreak
    }

    func completeTimer() {
        timerMode = .completed
    }
}
