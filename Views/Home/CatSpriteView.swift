//
//  CatSpriteView.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 17/05/2026.
//
import SwiftUI
import SpriteKit

import SwiftUI
import SpriteKit

struct CatSpriteView: View {
    let catState: CatState

    var body: some View {
        SpriteView(
            scene: {
                let scene = CatScene(catState: catState)
                scene.size = CGSize(width: 240, height: 240)
                scene.scaleMode = .resizeFill
                scene.backgroundColor = .clear
                return scene
            }(),
            options: [.allowsTransparency]
        )
        .frame(width: 240, height: 240)
    }
}
