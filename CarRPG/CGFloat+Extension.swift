//
//  CGFloat+Extension.swift
//  CarRPG
//
//  Created by Ilya Macbook on 15.01.18.
//  Copyright © 2018 Ilya Biltuev. All rights reserved.
//

import CoreGraphics

/** The value of π as a CGFloat */
let π = CGFloat.pi

public extension CGFloat {
    /**
     * Converts an angle in degrees to radians.
     */
    public func degreesToRadians() -> CGFloat {
        return π * self / 180.0
    }
    
    /**
     * Converts an angle in radians to degrees.
     */
    public func radiansToDegrees() -> CGFloat {
        return self * 180.0 / π
    }
}
