//
//  GameViewController.swift
//  CarRPG
//
//  Created by Ilya Macbook on 29.10.17.
//  Copyright © 2017 Ilya Biltuev. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window.
                scene.scaleMode = .aspectFill
                
                // Present the scene.
                view.presentScene(scene)
            }
            
            // Additional optimization to improve rendering performance.
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
}
