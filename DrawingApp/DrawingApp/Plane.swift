//
//  Plane.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/31.
//

import Foundation

struct Plane {
    var squareIncluded : [Square]
    
    mutating func add(_ square : Square) {
        self.squareIncluded.append(square)
    }
    
    func count() -> Int{
        return self.squareIncluded.count
    }
}
