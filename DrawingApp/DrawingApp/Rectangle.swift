//
//  Rectangle.swift
//  DrawingApp
//
//  Created by 김하림 on 2023/03/30.
//

import Foundation

//Concrete Product
class Rectangle : RectangleComponent {
    var id:Id
    var size:RectangleSize
    var position:RectanglePosition
    var backGroundColor:BackGroundColor
    var alpha:Alpha
    
    init(id:Id, size:RectangleSize, position:RectanglePosition, backGroundColor:BackGroundColor, alpha:Alpha) {
        
        self.id = id
        self.size = size
        self.position = position
        self.backGroundColor = backGroundColor
        self.alpha = alpha
    }
    
}

extension Rectangle : CustomStringConvertible {
    var description: String {
        return "(\(id.getId()), X:\(position.getPositionX()), Y\(position.getPositionY()):, W\(size.getWidth()), H\(size.getHeight()), R:\(backGroundColor.getRed()), G:\(backGroundColor.getGreen()), B:\(backGroundColor.getBlue()), Alpha:\(alpha.getAlpha()))"
    }
}
