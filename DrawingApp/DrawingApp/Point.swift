//
//  Point.swift
//  DrawingApp
//
//  Created by PJB on 2023/04/03.
//

import Foundation
class Point: CustomStringConvertible {
    private var positionX: Double
    private var positionY: Double
    
    init(positionX: Double, positionY: Double) {
        self.positionX = positionX
        self.positionY = positionY
    }
    
    var description: String {
        return "X: \(positionX), Y: \(positionY)"
    }
}
