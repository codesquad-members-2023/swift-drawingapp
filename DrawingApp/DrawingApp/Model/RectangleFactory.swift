//
//  RectangleFactory.swift
//  DrawingApp
//
//  Created by ilim on 2023/04/02.
//

import Foundation

class RectangleFactory {
    func makeRectangle(x: Double, y:Double, width: Double, height: Double) -> Rectangle {
        let str = "abcdefghijklmnopqrstuvwxyz0123456789"
        let length = 9
        let id = str.createRandomString(length: length)
        let (r, g, b, alpha) = (Int.random(in: 0...255), Int.random(in: 0...255), Int.random(in: 0...255), Int.random(in: 1...10))
        
        return Rectangle(id: id, width: width, height: height, xCoordinate: x, yCoordinate: y, R: r, G: g, B: b, alpha: alpha)
    }
}

extension String {
    func createRandomString(length: Int) -> String {
        var str = ""
        
        for i in 1...length {
            str += String(self.randomElement()!)
            if i != length && i % 3 == 0 {
                str += "-"
            }
        }
        
        return str
    }
}
