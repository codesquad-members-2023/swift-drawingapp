//
//  Rectangle.swift
//  DrawingApp
//
//  Created by apple on 2023/04/05.
//

import Foundation

class Rectangle {
    
    private var id: String
    private var w: Double
    private var h: Double
    private var x: Double
    private var y: Double
    private var r: Int
    private var g: Int
    private var b: Int
    private var alpha: Int
    
    init(id:String, w: Double, h:Double, x:Double, y:Double, r: Int, g: Int, b:Int, alpha:Int) {
        self.id = id
        self.w = w
        self.h = h
        self.x = x
        self.y = y
        self.r = r
        self.g = g
        self.b = b
        self.alpha = alpha
    }
}

extension Rectangle: CustomStringConvertible {
    var description: String{
        return "(\(id)), X:\(x), Y:\(y), W\(w), H\(h), R:\(r), G:\(g), B:\(b), Alpha:\(alpha)"
    }
}
