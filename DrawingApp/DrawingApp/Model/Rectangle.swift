//
//  Rectangle.swift
//  DrawingApp
//
//  Created by ilim on 2023/03/31.
//

import Foundation

class Rectangle {
    private var id: String
    private var width, height: Double
    private var xCoordinate, yCoordinate: Double
    private var R,G,B: Int
    private var alpha: Int
    
    init(id: String, width: Double, height: Double, xCoordinate: Double, yCoordinate: Double, R: Int, G: Int, B: Int, alpha: Int) {
        self.id = id
        self.width = width
        self.height = height
        self.xCoordinate = xCoordinate
        self.yCoordinate = yCoordinate
        self.R = R
        self.G = G
        self.B = B
        self.alpha = alpha
    }
}

extension Rectangle: CustomStringConvertible {
    var description: String {
        return "(\(id)), X:\(xCoordinate),Y:\(yCoordinate), W\(width), H\(height), R:\(R), G:\(G), B:\(B), Alpha: \(alpha)"
    }
}
