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
    static let size: CGSize = CGSize(width: 32, height: 16)
    static let zPosition: CGFloat = 50
    static let pointsToMovePerSecond: CGFloat = 200
    static let kRotateLeftAction = "rotateLeftAction"
    static let kRotateRightAction = "rotateRightAction"
}

class Player: SKSpriteNode {
    private let rotateLeftAction: SKAction = SKAction.repeatForever(SKAction.rotate(byAngle: 2 * π, duration: 3))
    private let rotateRightAction: SKAction = SKAction.repeatForever(SKAction.rotate(byAngle: -2 * π, duration: 3))
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init() {
        super.init(texture: SKTexture(imageNamed: "pickup"),
                   color: .clear,
                   size: PlayerSettings.size)
        name = "Player"
        zPosition = PlayerSettings.zPosition
        physicsBody = SKPhysicsBody(rectangleOf: size)
        physicsBody?.restitution = 1.0 // Bounce of objects.
        physicsBody?.linearDamping = 0.5 // Gradually lose speed.
        physicsBody?.friction = 0
    }
    
    func moveForward() {
        physicsBody?.velocity = CGVector(length: PlayerSettings.pointsToMovePerSecond, angle: zRotation)
    }
    
    func moveBackwards() {
        physicsBody?.velocity = CGVector(length: -PlayerSettings.pointsToMovePerSecond * 0.75, angle: zRotation)
    }
    
    func startRotationToLeft() {
        run(rotateLeftAction, withKey: PlayerSettings.kRotateLeftAction)
    }
    
    func startRotationToRight() {
        run(rotateRightAction, withKey: PlayerSettings.kRotateRightAction)
    }
}
