//
//  Plane.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/31.
//

import Foundation

class Plane  {
    private var squareIncluded : [Square] = []
    
    
    subscript(index: Int) -> Square {
        return self.squareIncluded[index]
    }
    
    func add(_ square : Square) {
        self.squareIncluded.append(square)
    }
    
    func count() -> Int{
        return self.squareIncluded.count
    }
    
    func whichIndexOfSquareisIncludedCoordinate (point : CGPoint) -> Int?{
        return squareIncluded.lastIndex(where: {$0.position.isCoordinateContained(point: point)})
    }
    
    func update(index : Int, colorValue : Color , alphaValue : Alpha) {
        
        guard self.squareIncluded.count > index else {
            return 
        }
        self.squareIncluded[index].backgroundColor = colorValue
        self.squareIncluded[index].alpha = alphaValue
        
        var obj = colorValue.convert()
        obj.append(alphaValue.convert())
        
        NotificationCenter.default.post(name: Notification.Name("MODEL CHANGED"), object: obj)
    }
    
}
