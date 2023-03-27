//
//  Rectangle.swift
//  DrawingApp
//
//  Created by leehwajin on 2023/03/27.
//

import Foundation

class Rectangle{
    var id : String
    var width : Double
    var height : Double
    var locatedX : Double
    var locatedY : Double
    var colorR : Int
    var colorG : Int
    var colorB : Int
    var alpha : Int
    
    init(id: String, width: Double, height: Double, locatedX: Double, locatedY: Double, colorR: Int, colorG: Int, colorB: Int, alpha: Int) {
        self.id = id
        self.width = width
        self.height = height
        self.locatedX = locatedX
        self.locatedY = locatedY
        self.colorR = colorR
        self.colorG = colorG
        self.colorB = colorB
        self.alpha = alpha
    }
}

extension Rectangle : CustomStringConvertible{
    //Rect1 (fxd-0fz-4b9), X:10,Y:200, W150, H120, R:245, G:0, B:245, Alpha: 9
    var description: String {
            return "(\(id), X:\(locatedX), Y:\(locatedY), W\(width), H\(height), R:\(colorR), G:\(colorG), B:\(colorB), Alpha:\(alpha)"
        }
}
