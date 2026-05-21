//
//  CatScene.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 17/05/2026.
//
import SpriteKit

private struct CatAnimation {
    let tagName: String
    let jsonName: String
    let spritesheetName: String
}

class CatScene: SKScene {
    private let catNode = SKSpriteNode()
    private let catState: CatState
    private let catAnimationJSONName = "cat_idle_spritesheet"
    private let catSpritesheetName = "cat_idle_spritesheet"

    private lazy var idleAnimations = [
        CatAnimation(tagName: "lickpaws", jsonName: catAnimationJSONName, spritesheetName: catSpritesheetName),
        CatAnimation(tagName: "tailwiggle", jsonName: catAnimationJSONName, spritesheetName: catSpritesheetName),
        CatAnimation(tagName: "idle", jsonName: catAnimationJSONName, spritesheetName: catSpritesheetName)
    ]

    init(catState: CatState) {
        self.catState = catState
        super.init(size: CGSize(width: 230, height: 230))
    }

    required init?(coder aDecoder: NSCoder) {
        self.catState = .idle
        super.init(coder: aDecoder)
    }

    override func didMove(to view: SKView) {
        backgroundColor = .clear

        catNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        catNode.setScale(5)

        addChild(catNode)

        playAnimationForCurrentState()
    }

    private func playAnimationForCurrentState() {
        switch catState {
        case .idle:
            playRandomIdleAnimation()

        case .focused:
            playLoopingAnimation(tagName: "focused")

        case .resting:
            playLoopingAnimation(tagName: "resting")

        case .completed:
            playLoopingAnimation(tagName: "completed")
        }
    }

    //This function plays the idle animation randomly on HomeView when user starts the applicaiton until user slides to start
    
    private func playRandomIdleAnimation() {
        catNode.removeAllActions()

        guard let idleAnimation = idleAnimations.randomElement(),
              let animation = AsepriteAnimationLoader.loadAnimationOnce(
                jsonName: idleAnimation.jsonName,
                spritesheetName: idleAnimation.spritesheetName,
                tagName: idleAnimation.tagName
              ) else {
            return
        }

        let wait = SKAction.wait(forDuration: Double.random(in: 0.4...1.2))

        let playNext = SKAction.run { [weak self] in
            self?.playRandomIdleAnimation()
        }

        catNode.run(.sequence([
            animation,
            wait,
            playNext
        ]))
    }

    private func playLoopingAnimation(tagName: String) {
        catNode.removeAllActions()

        if let animation = AsepriteAnimationLoader.loadLoopingAnimation(
            jsonName: catAnimationJSONName,
            spritesheetName: catSpritesheetName,
            tagName: tagName
        ) {
            catNode.run(animation)
        }
    }
}


