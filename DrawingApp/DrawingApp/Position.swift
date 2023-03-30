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
    private let widthOfViewFrame = 150.0
    private let heightOfViewFrame = 120.0
    
    
    init(width : Double , height : Double ) {
        self.xLimit = width
        self.yLimit = height
        self.x = generateX()
        self.y = generateY()
    }
    
    private func generateX () -> Double {
        return round(Double.random(in: 0...(xLimit - widthOfViewFrame)))
    }
    
    private func generateY () -> Double{
        return round(Double.random(in: 0...(yLimit - heightOfViewFrame)))
    }
}

extension Position : CustomStringConvertible {
    var description: String {
        return "X : \(self.x) , Y : \(self.y)"
    }
}
