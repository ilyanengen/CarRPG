//
//  Player.swift
//  CarRPG
//
//  Created by Ilya Macbook on 04.01.18.
//  Copyright © 2018 Ilya Biltuev. All rights reserved.
//

import Foundation
import SpriteKit

public enum PlayerSettings {
    static let size: CGSize = CGSize(width: 32, height: 32)
    static let zPosition: CGFloat = 50
    static let speed: CGFloat = 100
}

class Player: SKSpriteNode {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(texture: SKTexture(imageNamed: "pickup"),
                   color: .white,
                   size: PlayerSettings.size)
        name = "Player"
        zPosition = PlayerSettings.zPosition
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.restitution = 1.0 // Bounce of objects.
        physicsBody?.linearDamping = 0.5 // Gradually lose speed.
        physicsBody?.friction = 0
    }

//    func move(target: CGPoint) {
//        guard let physicsBody = physicsBody else { return }
//        let newVelocity = (target - position).normalized() * PlayerSettings.playerSpeed
//        physicsBody.velocity = CGVector(point: newVelocity)
//    }
}
