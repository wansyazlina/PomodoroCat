//
//  CatScene.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 17/05/2026.
//
import SpriteKit

class CatScene: SKScene {
    private let catNode = SKSpriteNode()
    private let animationTag: String

    init(animationTag: String) {
        self.animationTag = animationTag
        super.init(size: CGSize(width: 230, height: 230))
    }

    required init?(coder aDecoder: NSCoder) {
        self.animationTag = "tailwiggle"
        super.init(coder: aDecoder)
    }

    override func didMove(to view: SKView) {
        backgroundColor = .clear

        catNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        catNode.setScale(5) //scale cat size here

        addChild(catNode)

        playAnimation(tagName: animationTag)
    }

    private func playAnimation(tagName: String) {
        catNode.removeAllActions()

        if let animation = AsepriteAnimationLoader.loadAnimation(
            jsonName: "cat_wiggle_spritesheet",
            spritesheetName: "cat_wiggle_spritesheet",
            tagName: tagName
        ) {
            catNode.run(animation)
        }
    }
    
}


