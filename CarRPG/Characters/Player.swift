//
//  Player.swift
//  CarRPG
//
//  Created by Ilya Macbook on 04.01.18.
//  Copyright © 2018 Ilya Biltuev. All rights reserved.
//

import Foundation
import SpriteKit

enum PlayerSettings {
//    static let playerSpeed: CGFloat = 280.0
}

class Player: SKSpriteNode {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(texture: SKTexture(imageNamed: "pickup"),
                   color: .white,
                   size: CGSize(width: 32, height: 32))
        name = "Player"
        zPosition = 50
    
//        physicsBody = SKPhysicsBody(circleOfRadius: size.width/2)
//        physicsBody?.restitution = 1.0
//        physicsBody?.linearDamping = 0.5
//        physicsBody?.friction = 0
//        physicsBody?.allowsRotation = false
    }
    
    func move(target: CGPoint) {
//        guard let physicsBody = physicsBody else { return }
//        let newVelocity = (target - position).normalized()
//            * PlayerSettings.playerSpeed
//        physicsBody.velocity = CGVector(point: newVelocity)
    }
}