//
//  Rectangle.swift
//  DrawingApp
//
//  Created by leehwajin on 2023/03/27.
//

import Foundation

class Rectangle{
    let chars = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789~!@#$%^&*").map({String($0)})
    var id : String{
        let randomChars = (0..<9).map { _ in chars.randomElement()! }
        let tempId = randomChars[0...2].joined() + "-" + randomChars[3...5].joined() + "-" + randomChars[6...8].joined()
        return tempId
    }
    var width = Double(150)
    var height = Double(120)
    var locatedX : Double
    var locatedY : Double
    
    var colorR = (0...255).randomElement()
    var colorG = (0...255).randomElement()
    var colorB = (0...255).randomElement()
    var alpha = (1...10).randomElement()
    
    init(locatedX : Double, locatedY : Double){
       
        self.locatedX = locatedX
        self.locatedY = locatedY
    }
}

extension Rectangle : CustomStringConvertible{
    var description: String {
        if colorR != nil && colorG != nil && colorB != nil{
            return "(\(id), X:\(locatedX), Y:\(locatedY), W\(width), H\(height), R:\(colorR!), G:\(colorG!), B:\(colorB!), Alpha:\(alpha!)"
        }
           return "check your color"
        }
}


