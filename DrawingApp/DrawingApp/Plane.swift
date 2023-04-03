//
//  Plane.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/31.
//

import Foundation

struct Plane {
    var squareIncluded : [Square] = []
    
    
    subscript(index: Int) -> Square {
        return self.squareIncluded[index]
    }
    
    mutating func add(_ square : Square) {
        self.squareIncluded.append(square)
    }
    
    func count() -> Int{
        return self.squareIncluded.count
    }
    
    func isThereSquareIncludedCoordinate (point : CGPoint) -> Bool{
        for item in squareIncluded {
            guard !item.position.isCoordinateContained(point: point) else {
                return true
            }
        }
        return false
    }
}
