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
    private let widthOfViewFrame = 150.0
    private let heightOfViewFrame = 120.0
    
    
    init(width : Double , height : Double ) {
        self.x = generateX(xLimit: width)
        self.y = generateY(yLimit: height)
    }
    
    private func generateX (xLimit : Double) -> Double {
        return round(Double.random(in: 0...(xLimit - widthOfViewFrame)))
    }
    
    private func generateY (yLimit : Double) -> Double{
        return round(Double.random(in: 0...(yLimit - heightOfViewFrame)))
    }
}

extension Position : CustomStringConvertible {
    var description: String {
        return "X : \(self.x) , Y : \(self.y)"
    }
}
