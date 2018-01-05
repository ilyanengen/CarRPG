//
//  GameScene.swift
//  CarRPG
//
//  Created by Ilya Macbook on 29.10.17.
//  Copyright © 2017 Ilya Biltuev. All rights reserved.
//

import SpriteKit
import GameplayKit

private let buttonZPosition: CGFloat = 150

class GameScene: SKScene {
    
    var player = Player()
    
    override func didMove(to view: SKView) {
        addChild(player)
        setupCamera()
        setupButtons()
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
    
    func setupButtons() {
        guard let camera = camera else { return }
        let cameraWidth = self.size.width
        let cameraHeight = self.size.height
        
        let buttonSize = CGSize(width: 100, height: 100)
        
        let upButton = SKSpriteNode(color: .green, size: buttonSize)
        upButton.zPosition = buttonZPosition
        upButton.position = CGPoint(x: cameraWidth / 2 - upButton.size.width,
                                    y: (cameraHeight / 2) * -1 + upButton.size.height)
        
        let downButton = SKSpriteNode(color: .red, size: buttonSize)
        downButton.zPosition = buttonZPosition
        downButton.position = CGPoint(x: upButton.position.x - buttonSize.width * 1.5,
                                      y: upButton.position.y)
        camera.addChild(upButton)
        camera.addChild(downButton)
    }
}
