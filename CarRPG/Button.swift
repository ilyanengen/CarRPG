//
//  Button.swift
//  CarRPG
//
//  Created by Ilya Macbook on 07.01.18.
//  Copyright © 2018 Ilya Biltuev. All rights reserved.
//

import Foundation
import SpriteKit

private let buttonZPosition: CGFloat = 150
private let buttonDefaultSize = CGSize(width: 100, height: 100)

protocol ButtonDelegate: class {
    func buttonDidPress(sender: Button)
    func buttonStopPress(sender: Button)
}

class Button: SKSpriteNode {
    weak var delegate: ButtonDelegate?
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
        isUserInteractionEnabled = true
        zPosition = buttonZPosition
    }
 
    convenience init(title: String?, texture: SKTexture?, color: UIColor, size: CGSize = buttonDefaultSize) {
        self.init(texture: texture, color: color, size: size)
        name = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        isUserInteractionEnabled = true
        zPosition = buttonZPosition
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        setScale(0.6)
        self.delegate?.buttonDidPress(sender: self)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        setScale(1.0)
        self.delegate?.buttonStopPress(sender: self)
    }
}
