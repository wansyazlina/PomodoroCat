//
//  AsepriteAnimationLoader.swift
//  PomodoroCat
//
//  Created by Syazlina Aasim on 17/05/2026.
//
import SpriteKit

struct AsepriteData: Codable {
    let frames: [String: AsepriteFrame]
    let meta: AsepriteMeta
}

struct AsepriteFrame: Codable {
    let frame: AsepriteRect
    let duration: Int
}

struct AsepriteRect: Codable {
    let x: Int
    let y: Int
    let w: Int
    let h: Int
}

struct AsepriteMeta: Codable {
    let frameTags: [AsepriteFrameTag]
}

struct AsepriteFrameTag: Codable {
    let name: String
    let from: Int
    let to: Int
    let direction: String
}

final class AsepriteAnimationLoader {
    static func loadAnimation(
        jsonName: String,
        spritesheetName: String,
        tagName: String
    ) -> SKAction? {
        guard let url = Bundle.main.url(forResource: jsonName, withExtension: "json") else {
            print("Could not find JSON file")
            return nil
        }

        guard let data = try? Data(contentsOf: url),
              let asepriteData = try? JSONDecoder().decode(AsepriteData.self, from: data) else {
            print("Could not decode Aseprite JSON")
            return nil
        }

        guard let tag = asepriteData.meta.frameTags.first(where: { $0.name == tagName }) else {
            print("Could not find tag:", tagName)
            return nil
        }

        let sheetTexture = SKTexture(imageNamed: spritesheetName)
        sheetTexture.filteringMode = .nearest

        let sheetWidth = sheetTexture.size().width
        let sheetHeight = sheetTexture.size().height

        let sortedFrames = asepriteData.frames.sorted { $0.key < $1.key }

        let selectedFrames = Array(sortedFrames[tag.from...tag.to])

        var actions: [SKAction] = []

        for (_, frameData) in selectedFrames {
            let rect = frameData.frame

            let textureRect = CGRect(
                x: CGFloat(rect.x) / sheetWidth,
                y: 1.0 - CGFloat(rect.y + rect.h) / sheetHeight,
                width: CGFloat(rect.w) / sheetWidth,
                height: CGFloat(rect.h) / sheetHeight
            )

            let texture = SKTexture(rect: textureRect, in: sheetTexture)
            texture.filteringMode = .nearest

            actions.append(.setTexture(texture, resize: true)) //The resize: true makes sure that the dimensions isnt zero
            actions.append(.wait(forDuration: Double(frameData.duration) / 1000.0))
        }

        return .repeatForever(.sequence(actions))
    }
}
