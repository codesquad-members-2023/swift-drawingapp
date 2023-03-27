//
//  Rectangle.swift
//  DrawingApp
//
//  Created by leehwajin on 2023/03/27.
//

import Foundation

class Rectangle{
    var id : String
    var width = Double(150)
    var height = Double(120)
    var locatedX : Double
    var locatedY : Double
    
    var colorR = (0...255).randomElement()
    var colorG = (0...255).randomElement()
    var colorB = (0...255).randomElement()
    var alpha = (1...10).randomElement()
    
    init(id: String, locatedX : Double, locatedY : Double){
        self.id = id
        self.locatedX = locatedX
        self.locatedY = locatedY
    }
}

extension Rectangle : CustomStringConvertible{
    //Rect1 (fxd-0fz-4b9), X:10,Y:200, W150, H120, R:245, G:0, B:245, Alpha: 9
    var description: String {
        if colorR != nil && colorG != nil && colorB != nil{
            return "(\(id), X:\(locatedX), Y:\(locatedY), W\(width), H\(height), R:\(colorR!), G:\(colorG!), B:\(colorB!), Alpha:\(alpha!)"
        }
           return "check your color"
        }
}


