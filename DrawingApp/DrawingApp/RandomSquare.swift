//
//  Square.swift
//  DrawingApp
//
//  Created by SONG on 2023/03/29.
//

import Foundation

class RandomSquare : Square{
    var id : ID
    var size : Size
    var position : Position
    var backgroundColor : Color
    var alpha : Alpha
    
    init(id: ID, size: Size, position: Position, backgroundColor: Color, alpha: Alpha) {
        self.id = id
        self.size = size
        self.position = position
        self.backgroundColor = backgroundColor
        self.alpha = alpha
    }
}

extension RandomSquare : CustomStringConvertible {
    var description: String {
        return "\(self.id.description) , \(self.size.description) , \(self.position.description) , \(self.backgroundColor.description) , \(self.alpha.description)"
    }
}
