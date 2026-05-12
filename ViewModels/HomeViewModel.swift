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
    var catState: CatState = .idle

    func startIntro() {
        catState = .focused
    }

    var catImageName: String {
        switch catState {
        case .idle:
            return "cat_idle"
        case .focused:
            return "cat_focused"
        case .resting:
            return "cat_resting"
        case .completed:
            return "cat_completed"
        }
    }
}
