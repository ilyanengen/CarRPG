//
//  GameScene.swift
//  CarRPG
//
//  Created by Ilya Macbook on 29.10.17.
//  Copyright © 2017 Ilya Biltuev. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player = Player()
    
    override func didMove(to view: SKView) {
        addChild(player)
    }

    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func setupCamera() {
        // Make camera always follow player.
        guard let camera = camera else { return }
        let zeroDistance = SKRange(constantValue: 0)
        let playerConstraint = SKConstraint.distance(zeroDistance, to: player)
        camera.constraints = [playerConstraint]
    }
}
