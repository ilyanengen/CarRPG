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
    private var player = Player()
    private var isUpButtonTapped: Bool = false
    private var isDownButtonTapped: Bool = false
    
    override func didMove(to view: SKView) {
        addChild(player)
        setupCamera()
        setupButtons()
    }

    override func update(_ currentTime: TimeInterval) {
        // Player is going while upButton is pressed.
        if isUpButtonTapped == true {
            player.moveForward()
        }
        if isDownButtonTapped == true {
            player.moveBackwards()
        }
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
                isUpButtonTapped = true
            case "downButton":
                print("downButton pressed")
                isDownButtonTapped = true
            case "leftButton":
                print("leftButton pressed")
                if isUpButtonTapped == true || isDownButtonTapped == true {
                    player.startRotationToLeft()
                }
            case "rightButton":
                print("rightButton pressed")
                if isUpButtonTapped == true || isDownButtonTapped == true {
                    player.startRotationToRight()
                }
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
                isUpButtonTapped = false
                
                // Don't allow rotation after gas/stop buttons were released.
                player.removeAction(forKey: PlayerSettings.kRotateLeftAction)
                player.removeAction(forKey: PlayerSettings.kRotateRightAction)
            case "downButton":
                print("downButton stopped")
                isDownButtonTapped = false
                
                // Don't allow rotation after gas/stop buttons were released.
                player.removeAction(forKey: PlayerSettings.kRotateLeftAction)
                player.removeAction(forKey: PlayerSettings.kRotateRightAction)
            case "leftButton":
                print("leftButton stopped")
                player.removeAction(forKey: PlayerSettings.kRotateLeftAction)
            case "rightButton":
                print("rightButton stopped")
                player.removeAction(forKey: PlayerSettings.kRotateRightAction)
            default:
                print("button stopped - default case")
            }
        }
    }
}
