//
//  GameScene.swift
//  CarRPG
//
//  Created by Ilya Macbook on 29.10.17.
//  Copyright © 2017 Ilya Biltuev. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, ButtonDelegate {

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

        let upButton = Button(title: "upButton", texture: nil, color: .green)
        upButton.position = CGPoint(x: cameraWidth / 2 - upButton.size.width,
                                    y: (cameraHeight / 2) * -1 + upButton.size.height)

        let downButton = Button(title: "downButton", texture: nil, color: .red)
        downButton.position = CGPoint(x: upButton.position.x - downButton.size.width * 1.5,
                                      y: upButton.position.y)

        let leftButton = Button(title: "leftButton", texture: nil, color: .blue)
        leftButton.position = CGPoint(x: (cameraWidth / 2) * -1 + leftButton.size.width,
                                      y: upButton.position.y)

        let rightButton = Button(title: "rightButton", texture: nil, color: .blue)
        rightButton.position = CGPoint(x: leftButton.position.x + rightButton.size.width * 1.5,
                                       y: upButton.position.y)
        
        upButton.delegate = self
        downButton.delegate = self
        leftButton.delegate = self
        rightButton.delegate = self
        
        camera.addChild(upButton)
        camera.addChild(downButton)
        camera.addChild(leftButton)
        camera.addChild(rightButton)
    }
    
    // MARK: ButtonDelegate
    func buttonDidPress(sender: Button) {
        if let buttonName = sender.name {
            switch buttonName {
            case "upButton":
                print("upButton pressed")
            case "downButton":
                print("downButton pressed")
            case "leftButton":
                print("leftButton pressed")
                player.zRotation = player.zRotation + .pi / 8
            case "rightButton":
                print("rightButton pressed")
                player.zRotation = player.zRotation - .pi / 8
            default:
                print("button pressed - default case")
            }
        }
    }
    
    func buttonStopPress(sender: Button) {
        if let buttonName = sender.name {
            switch buttonName {
            case "upButton":
                print("upButton stopped")
            case "downButton":
                print("downButton stopped")
            case "leftButton":
                print("leftButton stopped")
            case "rightButton":
                print("rightButton stopped")
            default:
                print("button stopped - default case")
            }
        }
    }
}
