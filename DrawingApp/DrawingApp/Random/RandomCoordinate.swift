//
//  RandomCoordinate.swift
//  DrawingApp
//
//  Created by ilim on 2023/04/03.
//

import Foundation

class Coordinate {
    var x: Double = 0
    var y: Double = 0
    let size = Size()

    init(width: Double, height: Double) {
        x = Double.random(in: 0...(width - size.width))
        y = Double.random(in: 0...(height - size.height))
    }
}

extension Coordinate:CustomStringConvertible {
    var description: String {
        return "X:\(Int(x)),Y:\(Int(y))"
    }
}
