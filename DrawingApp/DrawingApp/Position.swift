//
//  Position.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/29.
//

import Foundation

class Position {
    private var x : Double = 0.0
    private var y : Double = 0.0
    private var xLimit : Double
    private var yLimit : Double
    
    init(width : Double , height : Double ) {
        self.xLimit = width
        self.yLimit = height
        self.x = setX()
        self.y = setY()
    }
    
    private func setX () -> Double {
        return Double.random(in: 0.0 ... xLimit)
    }
    
    private func setY () -> Double{
        return Double.random(in: 0.0 ... yLimit)
    }
}
